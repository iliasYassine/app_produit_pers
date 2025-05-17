import { TestBed } from '@angular/core/testing';

import { DeleteTotalService } from './delete-total.service';

describe('DeleteTotalService', () => {
  let service: DeleteTotalService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(DeleteTotalService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
