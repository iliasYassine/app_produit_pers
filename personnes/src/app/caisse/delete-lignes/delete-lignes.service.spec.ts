import { TestBed } from '@angular/core/testing';

import { DeleteLignesService } from './delete-lignes.service';

describe('DeleteLignesService', () => {
  let service: DeleteLignesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(DeleteLignesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
