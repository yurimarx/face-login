import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PostFaceRoutingModule } from './postface-routing.module';
import { PostFaceComponent } from './postface.component';
import { ButtonModule } from 'primeng/button';
import { CheckboxModule } from 'primeng/checkbox';
import { FormsModule } from '@angular/forms';
import { PasswordModule } from 'primeng/password';
import { InputTextModule } from 'primeng/inputtext';
import { FileUploadModule } from 'primeng/fileupload';
import { WebcamModule } from 'ngx-webcam';
import { ToastModule } from 'primeng/toast';

@NgModule({
    imports: [
        CommonModule,
        ToastModule,
        FileUploadModule,
        PostFaceRoutingModule,
        WebcamModule,
        ButtonModule,
        CheckboxModule,
        InputTextModule,
        FormsModule,
        PasswordModule
    ],
    declarations: [PostFaceComponent]
})
export class PostFaceModule { }
