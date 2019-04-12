import {Component, Input, OnInit} from '@angular/core';
import {AircraftsService} from '../../../services/aircrafts.service';
import {NzMessageService} from 'ng-zorro-antd';
import {FormControl, Validators} from '@angular/forms';
import {AircraftFormComponent} from './aircraft-form.component';

@Component({
  selector: 'aircraft-form-board-number',
  providers: [AircraftsService],
  templateUrl: 'aircraft-form-board-number.component.html',
  styleUrls: ['aircraft-form-board-number.component.css']
})

export class AircraftFormBoardNumberComponent implements OnInit {
  @Input() nz2WMain: AircraftFormComponent;
  @Input() nz2Control: FormControl;
  @Input() nz2Required = true;
  @Input() nz2Title = 'Бортовой номер';
  @Input() nz2RequiredErrorMsg = 'Введите бортовой номер!';
  @Input() nz2MaxLengthErrorMsg = 'Бортовой номер не должен быть длинее 20 символов!';
  @Input() nz2DbValueFoundErrorMsg = 'Введенный бортовой номер уже существует!';
  @Input() nz2DbSearchErrorMsg = 'Операция поиска бортового номера не может быть выполнена';
  @Input() nz2IsDbSearchEnabled = true;
  private isDbSearchStarted = false;
  private isDbValueFound = false;
  private originalValue: string;
  dbSearch(value: string): void {
    this.isDbValueFound = false;
    this.isDbSearchStarted = true;
    this.aircraftsService.isBoardNumberExists(value).subscribe((result) => {
      this.isDbValueFound = result.value;
      this.isDbSearchStarted = false;
    }, () => {
      this.isDbValueFound = false;
      this.isDbSearchStarted = false;
      if (this.nz2DbSearchErrorMsg.length !== 0 ) {
        this.messageService.error(this.nz2DbSearchErrorMsg);
      }
    });
  }

  setValue(value: string) {
    this.originalValue = value;
    this.nz2Control.setValue(value);
  }

  value(): string {
    return this.nz2Control.value;
  }

  isValidation(): boolean {
    return this.nz2Control.pending || this.isDbSearchStarted;
  }

  isValid(): boolean {
    return !this.isValidation() && this.nz2Control.valid && !this.isDbValueFound;
  }

  isDirtyValid(): boolean {
    if (!this.nz2Control.dirty) {
      return true;
    }
    return this.nz2Control.dirty && this.isValid();
  }

  isShowRequiredError(): boolean {
    if (this.isDirtyValid()) {
      return false;
    }
    if (this.nz2Control.errors === null) {
      return false;
    }
    return this.nz2Control.errors['required'] !== null && this.nz2Control.errors['required'] !== undefined;
  }

  isShowMaxLengthError(): boolean {
    if (this.isDirtyValid()) {
      return false;
    }
    if (this.isShowRequiredError()) {
      return false;
    }
    if (this.nz2Control.errors === null) {
      return false;
    }
    return this.nz2Control.errors['maxlength'] !== null && this.nz2Control.errors['maxlength'] !== undefined;
  }

  isShowDbValueFoundError(): boolean {
    if (this.isDirtyValid()) {
      return false;
    }
    if (this.isShowRequiredError()) {
      return false;
    }
    if (this.isShowMaxLengthError()) {
      return false;
    }
    return this.isDbValueFound;
  }

  constructor(private aircraftsService: AircraftsService, private messageService: NzMessageService) {}

  ngOnInit(): void {
    this.nz2WMain.setWBoardNumber(this);
    if (this.nz2IsDbSearchEnabled) {
      this.nz2Control.valueChanges.subscribe(
        (value) => {
          if (value !== '' && value !== this.originalValue) {
            this.dbSearch(value);
          }
        }
      );
    }
  }
}
