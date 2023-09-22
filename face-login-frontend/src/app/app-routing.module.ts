import { RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { NotfoundComponent } from './facelogin/notfound/notfound.component';
import { AppLayoutComponent } from "./layout/app.layout.component";

@NgModule({
    imports: [
        RouterModule.forRoot([
            {
                path: '', component: AppLayoutComponent,
            },
            { path: 'postface', loadChildren: () => import('./facelogin/postface/postface.module').then(m => m.PostFaceModule) },
            { path: 'facecompare', loadChildren: () => import('./facelogin/facecompare/facecompare.module').then(m => m.FaceCompareModule) },
            { path: 'error', loadChildren: () => import('./facelogin/error/error.module').then(m => m.ErrorModule) },
            { path: 'access', loadChildren: () => import('./facelogin/access/access.module').then(m => m.AccessModule) },
            { path: 'notfound', component: NotfoundComponent },
            { path: '**', redirectTo: '/notfound' },
        ], { scrollPositionRestoration: 'enabled', anchorScrolling: 'enabled', onSameUrlNavigation: 'reload' })
    ],
    exports: [RouterModule]
})
export class AppRoutingModule {
}
