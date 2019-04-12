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
  private control: FormControl = new FormControl(null, [Validators.required, Validators.maxLength(20)]);
  @Input() nz2FormGroup: AircraftFormComponent;
  @Input() nz2Id = 'boardNumber';
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

  reset(): void {
    this.control.reset();
  }

  setValue(value: string) {
    this.originalValue = value;
    this.control.setValue(value);
  }

  value(): string {
    return this.control.value;
  }

  isValidation(): boolean {
    return this.control.pending || this.isDbSearchStarted;
  }

  isValid(): boolean {
    return !this.isValidation() && this.control.valid && !this.isDbValueFound;
  }

  isDirtyValid(): boolean {
    if (!this.control.dirty) {
      return true;
    }
    return this.control.dirty && this.isValid();
  }

  isShowRequiredError(): boolean {
    if (this.isDirtyValid()) {
      return false;
    }
    if (this.control.errors === null) {
      return false;
    }
    return this.control.errors['required'] !== null && this.control.errors['required'] !== undefined;
  }

  isShowMaxLengthError(): boolean {
    if (this.isDirtyValid()) {
      return false;
    }
    if (this.isShowRequiredError()) {
      return false;
    }
    if (this.control.errors === null) {
      return false;
    }
    return this.control.errors['maxlength'] !== null && this.control.errors['maxlength'] !== undefined;
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
    this.nz2FormGroup.addControl(this.nz2Id, this);
    if (this.nz2IsDbSearchEnabled) {
      this.control.valueChanges.subscribe(
        (value) => {
          if (value !== '' && value !== this.originalValue) {
            this.dbSearch(value);
          }
        }
      );
    }
  }
}
