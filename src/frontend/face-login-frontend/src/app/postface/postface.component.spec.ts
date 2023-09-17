import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PostfaceComponent } from './postface.component';

describe('PostfaceComponent', () => {
  let component: PostfaceComponent;
  let fixture: ComponentFixture<PostfaceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PostfaceComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PostfaceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
