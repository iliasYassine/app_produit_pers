import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SuiviCommandeClientComponent } from './suivi-commande-client.component';

describe('SuiviCommandeClientComponent', () => {
  let component: SuiviCommandeClientComponent;
  let fixture: ComponentFixture<SuiviCommandeClientComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SuiviCommandeClientComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(SuiviCommandeClientComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
