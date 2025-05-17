import { TestBed } from '@angular/core/testing';

import { ServiceFournisseurService } from './service-fournisseur.service';

describe('ServiceFournisseurService', () => {
  let service: ServiceFournisseurService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ServiceFournisseurService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
