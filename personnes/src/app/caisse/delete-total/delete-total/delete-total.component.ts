import { Component, OnInit } from '@angular/core';
import { Transaction } from '../../transaction.model';
import { DeleteTotalService } from '../delete-total.service';
import { NgFor, NgIf } from '@angular/common';

@Component({
  selector: 'app-delete-total',
  standalone: true,
  imports: [NgIf,NgFor],
  templateUrl: './delete-total.component.html',
  styleUrl: './delete-total.component.css'
})
export class DeleteTotalComponent implements OnInit {
  constructor(private deleteTotalService: DeleteTotalService) { }
  total: Transaction[] = []; 
  
  ngOnInit(): void {
    this.getTotal();
  }

  getTotal() {
    this.deleteTotalService.getTotal().subscribe(data=>{
      this.total=data;
    }

    )
      
  }

  deleteTotal(id: number) {
    this.deleteTotalService.deleteTotal(id).subscribe(data=>{
      console.log("Total supprimé avec succès",data);
      this.getTotal();
    })
    
  }

}
