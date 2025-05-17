import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeleteTotalComponent } from './delete-total.component';

describe('DeleteTotalComponent', () => {
  let component: DeleteTotalComponent;
  let fixture: ComponentFixture<DeleteTotalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DeleteTotalComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DeleteTotalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
