import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FaceCompareRoutingModule } from './facecompare-routing.module';
import { FaceCompareComponent } from './facecompare.component';
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
        FaceCompareRoutingModule,
        WebcamModule,
        ButtonModule,
        CheckboxModule,
        InputTextModule,
        FormsModule,
        PasswordModule
    ],
    declarations: [FaceCompareComponent]
})
export class FaceCompareModule { }
