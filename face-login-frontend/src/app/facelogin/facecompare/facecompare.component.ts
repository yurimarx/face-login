import { Component } from '@angular/core';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { MessageService } from 'primeng/api';
import { FaceLoginService } from 'src/app/demo/service/facelogin.service';

interface UploadEvent {
    originalEvent: Event;
    files: File[];
}
@Component({
    selector: 'app-facecompare',
    templateUrl: './facecompare.component.html',
    providers: [MessageService],
    styles: [`
        :host ::ng-deep .pi-eye,
        :host ::ng-deep .pi-eye-slash {
            transform:scale(1.6);
            margin-right: 1rem;
            color: var(--primary-color) !important;
        }
    `]
})
export class FaceCompareComponent {


    uploadedFiles: any[] = [];

    constructor(public layoutService: LayoutService,
        public faceLoginService: FaceLoginService,
        private messageService: MessageService) { }

    onUpload(event: UploadEvent) {
        for (let file of event.files) {
            this.uploadedFiles.push(file);
        }

        this.faceLoginService.faceCompare(this.uploadedFiles[0], this.uploadedFiles[1]).subscribe({
            next: (value) => {
                if(value.result == 1) {
                    this.messageService.add({ severity: 'info', summary: 'Success', detail: 'Same person!' });
                } else {
                    this.messageService.add({ severity: 'warn', summary: 'No success', detail: 'Different persons!' });
                }
            },
            error: (error) => {
                this.messageService.add({ severity: 'error', summary: 'Error', detail: error });            alert("Usuário ou Senha inválido(s)!");
            }
        })

        
    }

}
