import { Component, OnInit } from '@angular/core';
import { PersonneService } from '../personne.service';
import { User } from '../personne.model';
import { NgFor, NgIf } from '@angular/common';
@Component({
  selector: 'app-personne-list',
  standalone: true,
  imports: [NgFor,NgIf],
  templateUrl: './personne-list.component.html',
  styleUrl: './personne-list.component.css'
})
export class PersonneListComponent implements OnInit {


  personne: User[] = [];

  constructor(private personneService: PersonneService) {}

  ngOnInit(): void {
    this.personneService.getUsers().subscribe(
      (data: User[]) => { 
        this.personne = data;
      }
    );
  }




}
