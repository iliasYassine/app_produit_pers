import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CaisseEnregistreuseComponent } from './caisse-enregistreuse.component';

describe('CaisseEnregistreuseComponent', () => {
  let component: CaisseEnregistreuseComponent;
  let fixture: ComponentFixture<CaisseEnregistreuseComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CaisseEnregistreuseComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CaisseEnregistreuseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
