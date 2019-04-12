import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {AircraftsService} from '../../../services/aircrafts.service';
import {AircraftFormBoardNumberComponent} from './aircraft-form-board-number.component';
import {AircraftModel} from '../../../models/aircraft.model';
import {AircraftFormMarkComponent} from './aircraft-form-mark.component';
import {AircraftFormModelComponent} from './aircraft-form-model.component';
import {AircraftFormTypeComponent} from './aircraft-form-type.component';

@Component({
  selector: 'aircraft-form',
  providers: [AircraftsService],
  templateUrl: 'aircraft-form.component.html',
  styleUrls: ['aircraft-form.component.css']
})

export class AircraftFormComponent implements OnInit {
  @Input() set nz2Data( data: AircraftModel ) {
    if (data !== null && data !== undefined) {
      if (this.isRefValid(this.boardNumber)) { this.boardNumber.setValue(data.boardNumber); }
      if (this.isRefValid(this.mark)) { this.mark.setValue(data.mark); }
      if (this.isRefValid(this.model)) { this.model.setValue(data.model); }
      if (this.isRefValid(this.type)) { this.type.setValue(data.type); }
    } else {
      if (this.isRefValid(this.boardNumber)) { this.boardNumber.setValue(''); }
      if (this.isRefValid(this.mark)) { this.mark.setValue(''); }
      if (this.isRefValid(this.model)) { this.model.setValue(''); }
      if (this.isRefValid(this.type)) { this.type.setValue(''); }
    }
  }
  constructor() {}
  formGroup = this;
  boardNumber: AircraftFormBoardNumberComponent;
  mark: AircraftFormMarkComponent;
  model: AircraftFormModelComponent;
  type: AircraftFormTypeComponent;
  addControl(id: string, control: any ): void {
    if (id === 'boardNumber') {
      this.boardNumber = control;
    } else if (id === 'mark') {
      this.mark = control;
    } else if (id === 'model') {
      this.model = control;
    } else if (id === 'type') {
      this.type = control;
    }

  }
  isRefValid(ref: any): boolean {
    return ref !== null && ref !== undefined;
  }
  isValid(): boolean {
    if (!this.isRefValid(this.boardNumber) || !this.isRefValid(this.mark) || !this.isRefValid(this.model)
      || !this.isRefValid(this.type)) {
      return false;
    }
    return this.boardNumber.isValid() && this.mark.isValid() && this.model.isValid() && this.type.isValid();
  }
  isDirty(): boolean {
    if (this.isRefValid(this.boardNumber)) {
      if (this.boardNumber.isDirty()) {
        return true;
      }
    }
    if (this.isRefValid(this.mark)) {
      if (this.mark.isDirty()) {
        return true;
      }
    }
    if (this.isRefValid(this.model)) {
      if (this.model.isDirty()) {
        return true;
      }
    }
    if (this.isRefValid(this.type)) {
      if (this.type.isDirty()) {
        return true;
      }
    }
    return false;
  }
  isDataChanged(): boolean {
    if (this.isRefValid(this.boardNumber)) {
      if (this.boardNumber.isValueChanged()) {
        return true;
      }
    }
    if (this.isRefValid(this.mark)) {
      if (this.mark.isValueChanged()) {
        return true;
      }
    }
    if (this.isRefValid(this.model)) {
      if (this.model.isValueChanged()) {
        return true;
      }
    }
    if (this.isRefValid(this.type)) {
      if (this.type.isValueChanged()) {
        return true;
      }
    }
    return false;
  }
  isDirtyValid(): boolean {
    if (!this.isRefValid(this.boardNumber) || !this.isRefValid(this.mark) || !this.isRefValid(this.model)
      || !this.isRefValid(this.type)) {
      return false;
    }
    if (!this.isDirty()) {
      return false;
    }
    return this.isDirty() && this.boardNumber.isValid() && this.mark.isValid() && this.model.isValid() && this.type.isValid();
  }
  isDirtyInvalid(): boolean {
    if (!this.isRefValid(this.boardNumber) || !this.isRefValid(this.mark) || !this.isRefValid(this.model)
      || !this.isRefValid(this.type)) {
      return false;
    }
    if (!this.isDirty()) {
      return false;
    }
    return this.isDirty() && !this.isValid();
  }
  reset(): void {
    if (this.isRefValid(this.boardNumber)) { this.boardNumber.reset(); }
    if (this.isRefValid(this.mark)) { this.mark.reset(); }
    if (this.isRefValid(this.model)) { this.model.reset(); }
    if (this.isRefValid(this.type)) { this.type.reset(); }
  }
  @Output() readonly nz2OnCancel = new EventEmitter<any>();
  private nzOnCancel(): void {
    this.reset();
    this.nz2OnCancel.emit();
  }

  ngOnInit(): void {
  }
}
