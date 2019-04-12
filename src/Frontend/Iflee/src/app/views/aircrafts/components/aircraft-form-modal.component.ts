import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {AircraftsService} from '../../../services/aircrafts.service';
import {AircraftModel} from '../../../models/aircraft.model';

@Component({
  selector: 'aircraft-form-modal',
  providers: [AircraftsService],
  templateUrl: 'aircraft-form-modal.component.html',
  styleUrls: ['aircraft-form-modal.component.css']
})

export class AircraftFormModalComponent implements OnInit {
  @Input() nz2Data: AircraftModel;
  @Input() nz2Visible: boolean;
  @Input() nz2IsNMode = true;
  @Input() nz2NTitle: string;
  @Input() nz2ETitle: string;
  @Output() readonly nz2OnCancel = new EventEmitter<any>();
  private nzOnCancel(): void {
    this.nz2OnCancel.emit();
  }
  private nz2Title(): string {
    if (this.nz2IsNMode) {
      return this.nz2NTitle;
    }
    return this.nz2ETitle;
  }
  hide(): void {
    this.nz2Visible = false;
    this.nzOnCancel();
  }
  ngOnInit(): void {
  }
}
