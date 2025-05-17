import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeleteLignesComponent } from './delete-lignes.component';

describe('DeleteLignesComponent', () => {
  let component: DeleteLignesComponent;
  let fixture: ComponentFixture<DeleteLignesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DeleteLignesComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DeleteLignesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
