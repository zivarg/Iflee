import {Component, Input, OnInit} from '@angular/core';
import {AircraftsService} from '../../../services/aircrafts.service';
import {AircraftFormComponent} from './aircraft-form.component';
import {FormControl, Validators} from '@angular/forms';
import {NzMessageService} from 'ng-zorro-antd';

@Component({
  selector: 'aircraft-form-model',
  providers: [AircraftsService],
  templateUrl: 'aircraft-form-model.component.html',
  styleUrls: ['aircraft-form-model.component.css']
})

export class AircraftFormModelComponent implements OnInit {
  private control: FormControl = new FormControl(null, [Validators.required, Validators.maxLength(255)]);
  @Input() nz2FormGroup: AircraftFormComponent;
  @Input() nz2Id = 'model';
  @Input() nz2Required = true;
  @Input() nz2Title = 'Модель';
  @Input() nz2RequiredErrorMsg = 'Введите модель!';
  @Input() nz2MaxLengthErrorMsg = 'Модель не должен быть длинее 255 символов!';
  @Input() nz2DbValueFoundErrorMsg = 'Модель уже существует!';
  @Input() nz2DbSearchErrorMsg = 'Операция поиска модели не может быть выполнена';
  @Input() nz2IsDbSearchEnabled = false;
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
