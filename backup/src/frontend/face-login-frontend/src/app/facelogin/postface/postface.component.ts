import { Component } from '@angular/core';
import { LayoutService } from 'src/app/layout/service/app.layout.service';
import { MessageService } from 'primeng/api';
import { WebcamImage } from 'ngx-webcam';
import { Observable, Subject } from 'rxjs';
import { FaceLoginService } from 'src/app/demo/service/facelogin.service';
import { Face } from 'src/app/facelogin/domain/face';

@Component({
    selector: 'app-postface',
    templateUrl: './postface.component.html',
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
export class PostFaceComponent {
    
    public face: Face = new Face();

    valCheck: string[] = ['remember'];
    password!: string;

    private trigger: Subject<any> = new Subject();
    public webcamImage!: WebcamImage;
    private nextWebcam: Subject<any> = new Subject();

    sysImage = '';

    ngOnInit() { }
    public getSnapshot(): void {
        this.trigger.next(void 0);
    }

    constructor(public layoutService: LayoutService,
                public faceLoginService: FaceLoginService,
        private messageService: MessageService) { }

    public captureImg(webcamImage: WebcamImage): void {
        this.webcamImage = webcamImage;
        this.sysImage = webcamImage!.imageAsDataUrl;
        this.face.image = this.sysImage
        
        this.faceLoginService.postFace(this.face).subscribe({
            next: (value) => {
                this.messageService.add({ severity: 'info', summary: 'Success', detail: value.message });
            },
            error: (error) => {
                this.messageService.add({ severity: 'error', summary: 'Error', detail: error });            alert("Usuário ou Senha inválido(s)!");
            }
        })
    
        console.info('got webcam image', this.sysImage);
    }

    public get invokeObservable(): Observable<any> {
        return this.trigger.asObservable();
    }

    public get nextWebcamObservable(): Observable<any> {
        return this.nextWebcam.asObservable();
    }
}
