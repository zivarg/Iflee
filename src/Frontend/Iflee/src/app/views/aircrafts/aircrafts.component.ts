import { Component, OnInit } from '@angular/core';
import {AircraftsService} from '../../services/aircrafts.service';

@Component({
  templateUrl: 'aircrafts.component.html',
  providers: [AircraftsService],
})
export class AircraftsComponent implements OnInit {
  ngOnInit(): void {
  }
}
