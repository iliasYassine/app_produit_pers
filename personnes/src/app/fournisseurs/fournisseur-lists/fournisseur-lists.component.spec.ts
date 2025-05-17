import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FournisseurListsComponent } from './fournisseur-lists.component';

describe('FournisseurListsComponent', () => {
  let component: FournisseurListsComponent;
  let fixture: ComponentFixture<FournisseurListsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FournisseurListsComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(FournisseurListsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
