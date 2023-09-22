import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { PostFaceComponent } from './postface.component';

@NgModule({
    imports: [RouterModule.forChild([
        { path: '', component: PostFaceComponent }
    ])],
    exports: [RouterModule]
})
export class PostFaceRoutingModule { }
