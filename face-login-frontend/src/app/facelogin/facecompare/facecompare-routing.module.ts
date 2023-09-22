import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { FaceCompareComponent } from './facecompare.component';

@NgModule({
    imports: [RouterModule.forChild([
        { path: '', component: FaceCompareComponent }
    ])],
    exports: [RouterModule]
})
export class FaceCompareRoutingModule { }
