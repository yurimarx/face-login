import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { take } from 'rxjs';
import { Observable } from 'rxjs';
import { Face } from '../../facelogin/domain/face';

@Injectable()
export class FaceLoginService {

    private url = 'http://localhost:55038/csp/facelogin/';

    constructor(private http: HttpClient) { }

    public postFace(face: Face): Observable<any> {
        const formData = new FormData();
        formData.append('file', face.image);
        formData.append('username', face.username);
        formData.append('password', face.password);
        return this.http.post<any>(this.url + 'postFace', formData).pipe(take(1));
    }

    public faceCompare(source: any, target: any): Observable<any> {
        const formData = new FormData();
        formData.append('source', source);
        formData.append('target', target);
        return this.http.post<any>(this.url + 'faceCompare', formData).pipe(take(1));
    }
    
}
