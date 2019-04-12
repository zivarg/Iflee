import {Component, EventEmitter, Input, OnInit, Output} from '@angular/core';
import {AircraftsService} from '../../../services/aircrafts.service';
import {FormBuilder, FormControl, Validators} from '@angular/forms';
import {AircraftFormBoardNumberComponent} from './aircraft-form-board-number.component';
import {AircraftModel} from '../../../models/aircraft.model';
import {AircraftFormMarkComponent} from './aircraft-form-mark.component';

@Component({
  selector: 'aircraft-form',
  providers: [AircraftsService],
  templateUrl: 'aircraft-form.component.html',
  styleUrls: ['aircraft-form.component.css']
})

export class AircraftFormComponent implements OnInit {
  @Input() set nz2Data( data: AircraftModel ) {
    if (data !== null && data !== undefined) {
      this.setBoardNumberValue(data.boardNumber);
      this.setMarkValue(data.mark);
    } else {
      this.setBoardNumberValue('');
      this.setMarkValue('');
    }
  }
  constructor(private formBuilder: FormBuilder) {}
  wMain = this;
  boardNumber: FormControl = new FormControl(null, [Validators.required, Validators.maxLength(20)]);
  wBoardNumber: AircraftFormBoardNumberComponent;
  setWBoardNumber(wBoardNumber: AircraftFormBoardNumberComponent): void {
    this.wBoardNumber = wBoardNumber;
  }
  isWBoardNumberNull(): boolean {
    return this.wBoardNumber === null || this.wBoardNumber === undefined;
  }
  setBoardNumberValue(value: string): void {
    if (!this.isWBoardNumberNull()) {
      this.wBoardNumber.setValue(value);
    }
  }
  setBoardNumberReset(): void {
    if (!this.isWBoardNumberNull()) {
      this.boardNumber.reset();
    }
  }
  isBoardNumberValid(): boolean {
    if (!this.isWBoardNumberNull()) {
      return this.wBoardNumber.isValid();
    }
  }
  mark: FormControl = new FormControl(null, [Validators.required, Validators.maxLength(10)]);
  wMark: AircraftFormMarkComponent;
  setWMark(wMark: AircraftFormMarkComponent): void {
    this.wMark = wMark;
  }
  isWMarkNull(): boolean {
    return this.wMark === null || this.wMark === undefined;
  }
  setMarkValue(value: string): void {
    if (!this.isWMarkNull()) {
      this.wMark.setValue(value);
    }
  }
  setMarkReset(): void {
    if (!this.isWMarkNull()) {
      this.mark.reset();
    }
  }
  isMarkValid(): boolean {
    if (!this.isWBoardNumberNull()) {
      return this.wMark.isValid();
    }
  }
  isValid(): boolean {
    return this.isBoardNumberValid() && this.isMarkValid();
  }

  reset(): void {
    this.setBoardNumberReset();
    this.setMarkReset();
  }
  @Output() readonly nz2OnCancel = new EventEmitter<any>();
  private nzOnCancel(): void {
    this.reset();
    this.nz2OnCancel.emit();
  }

  ngOnInit(): void {
  }
}
