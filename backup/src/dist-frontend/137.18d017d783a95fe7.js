"use strict";(self.webpackChunksakai_ng=self.webpackChunksakai_ng||[]).push([[137],{137:(j,p,t)=>{t.r(p),t.d(p,{FaceCompareModule:()=>A});var s=t(6814),c=t(3377),l=t(5219),e=t(4946),f=t(3859),g=t(2169),m=t(4104),d=t(6459);function v(o,n){if(1&o&&(e.TgZ(0,"li"),e._uU(1),e.qZA()),2&o){const a=n.$implicit;e.xp6(1),e.AsE("",a.name," - ",a.size," bytes")}}function h(o,n){if(1&o&&(e.TgZ(0,"ul"),e.YNc(1,v,2,2,"li",10),e.qZA()),2&o){const a=e.oxw(2);e.xp6(1),e.Q6J("ngForOf",a.uploadedFiles)}}function C(o,n){if(1&o&&e.YNc(0,h,2,1,"ul",9),2&o){const a=e.oxw();e.Q6J("ngIf",a.uploadedFiles.length)}}const F=function(){return{marginTop:"80px",width:"320px"}};let x=(()=>{var o;class n{constructor(r,i,u){this.layoutService=r,this.faceLoginService=i,this.messageService=u,this.uploadedFiles=[]}onUpload(r){for(let i of r.files)this.uploadedFiles.push(i);this.faceLoginService.faceCompare(this.uploadedFiles[0],this.uploadedFiles[1]).subscribe({next:i=>{this.messageService.add(1==i.result?{severity:"info",summary:"Success",detail:"Same person!"}:{severity:"warn",summary:"No success",detail:"Different persons!"})},error:i=>{this.messageService.add({severity:"error",summary:"Error",detail:i}),alert("Usu\xe1rio ou Senha inv\xe1lido(s)!")}})}}return(o=n).\u0275fac=function(r){return new(r||o)(e.Y36(f.P),e.Y36(g.d),e.Y36(l.ez))},o.\u0275cmp=e.Xpm({type:o,selectors:[["app-facecompare"]],features:[e._Bn([l.ez])],decls:11,vars:4,consts:[[1,"surface-ground","flex","align-items-center","justify-content-center","min-h-screen","min-w-screen","overflow-hidden"],[1,"flex","flex-column","align-items-center","justify-content-center"],[2,"border-radius","56px","padding","0.3rem","background","linear-gradient(180deg, var(--primary-color) 10%, rgba(33, 150, 243, 0) 30%)"],[1,"w-full","surface-card","py-8","px-5","sm:px-8",2,"border-radius","53px"],[1,"text-900","text-3xl","font-medium","mb-3"],[1,"col-md-12"],[1,"text-center"],["name","file[]","chooseLabel","Choose 2 images","uploadLabel","Compare the images","url","https://www.primefaces.org/cdn/api/upload.php","accept","image/*","maxFileSize","1000000",3,"multiple","onUpload"],["pTemplate","content"],[4,"ngIf"],[4,"ngFor","ngForOf"]],template:function(r,i){1&r&&(e._UZ(0,"p-toast"),e.TgZ(1,"div",0)(2,"div",1)(3,"div",2)(4,"div",3)(5,"div",4),e._uU(6,"Is it the same person? Check it"),e.qZA(),e.TgZ(7,"div",5)(8,"div",6)(9,"p-fileUpload",7),e.NdJ("onUpload",function(J){return i.onUpload(J)}),e.YNc(10,C,1,1,"ng-template",8),e.qZA()()()()()()()),2&r&&(e.Akn(e.DdM(3,F)),e.xp6(9),e.Q6J("multiple",!0))},dependencies:[s.sg,s.O5,m.FN,l.jx,d.p],styles:["[_nghost-%COMP%]     .pi-eye, [_nghost-%COMP%]     .pi-eye-slash{transform:scale(1.6);margin-right:1rem;color:var(--primary-color)!important}"]}),n})(),y=(()=>{var o;class n{}return(o=n).\u0275fac=function(r){return new(r||o)},o.\u0275mod=e.oAB({type:o}),o.\u0275inj=e.cJS({imports:[c.Bz.forChild([{path:"",component:x}]),c.Bz]}),n})();var S=t(336),T=t(8057),U=t(95),M=t(1423),Z=t(3714),z=t(2982);let A=(()=>{var o;class n{}return(o=n).\u0275fac=function(r){return new(r||o)},o.\u0275mod=e.oAB({type:o}),o.\u0275inj=e.cJS({imports:[s.ez,m.EV,d.O,y,z.Tm,S.hJ,T.nD,Z.j,U.u5,M.gz]}),n})()}}]);