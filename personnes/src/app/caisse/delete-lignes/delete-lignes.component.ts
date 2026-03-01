import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LignesTransaction } from '../ligne.model';
import { Transaction } from '../transaction.model';
import { DeleteLignesService } from './delete-lignes.service';
import { DeleteTotalService } from '../delete-total/delete-total.service';

@Component({
  selector: 'app-delete-lignes',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './delete-lignes.component.html',
  styleUrl: './delete-lignes.component.css'
})
export class DeleteLignesComponent implements OnInit {
  lignes: LignesTransaction[] = [];
  transactions: Transaction[] = [];

  deleteLigneId: number | null = null;
  deleteTransactionId: number | null = null;

  activeTab: 'transactions' | 'lignes' = 'transactions';

  constructor(
    private lignesService: DeleteLignesService,
    private totalService: DeleteTotalService
  ) {}

  ngOnInit(): void {
    this.loadAll();
  }

  loadAll() {
    this.loadLignes();
    this.loadTransactions();
  }

  loadLignes() {
    this.lignesService.getLignes().subscribe({
      next: (data) => { this.lignes = data; }
    });
  }

  loadTransactions() {
    this.totalService.getTotal().subscribe({
      next: (data) => { this.transactions = data; }
    });
  }

  askDeleteLigne(id: number) { this.deleteLigneId = id; }
  cancelDeleteLigne() { this.deleteLigneId = null; }

  doDeleteLigne(id: number) {
    this.lignesService.deleteLignes(id).subscribe({
      next: () => { this.deleteLigneId = null; this.loadLignes(); }
    });
  }

  askDeleteTransaction(id: number) { this.deleteTransactionId = id; }
  cancelDeleteTransaction() { this.deleteTransactionId = null; }

  doDeleteTransaction(id: number) {
    this.totalService.deleteTotal(id).subscribe({
      next: () => { this.deleteTransactionId = null; this.loadAll(); }
    });
  }
}
