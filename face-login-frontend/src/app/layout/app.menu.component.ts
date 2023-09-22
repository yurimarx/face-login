import { OnInit } from '@angular/core';
import { Component } from '@angular/core';
import { LayoutService } from './service/app.layout.service';

@Component({
    selector: 'app-menu',
    templateUrl: './app.menu.component.html'
})
export class AppMenuComponent implements OnInit {

    model: any[] = [];

    constructor(public layoutService: LayoutService) { }

    ngOnInit() {
        this.model = [
            {
                label: 'Links',
                items: [
                    { label: 'Face Compare', icon: 'pi pi-fw pi-home', routerLink: ['/facecompare'] },
                    { label: 'Face Compare', icon: 'pi pi-fw pi-home', routerLink: ['/postface'] }
                ]
            }
        ];
    }
}
