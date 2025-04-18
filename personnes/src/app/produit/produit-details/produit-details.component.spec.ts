import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProduitDetailsComponent } from './produit-details.component';

describe('ProduitDetailsComponent', () => {
  let component: ProduitDetailsComponent;
  let fixture: ComponentFixture<ProduitDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ProduitDetailsComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ProduitDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
