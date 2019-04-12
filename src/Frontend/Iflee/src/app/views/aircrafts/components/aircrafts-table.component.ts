import {Component, OnInit} from '@angular/core';
import {AircraftsService} from '../../../services/aircrafts.service';
import {forkJoin} from 'rxjs/internal/observable/forkJoin';
import {NzMessageService} from 'ng-zorro-antd';
import {AbstractControl, FormBuilder, FormGroup, Validators} from '@angular/forms';
import {AircraftModel} from '../../../models/aircraft.model';

@Component({
  selector: 'aircrafts-table',
  providers: [AircraftsService],
  templateUrl: 'aircrafts-table.component.html',
  styleUrls: ['aircrafts-table.component.css']
})

export class AircraftsTableComponent implements OnInit {
  pageIndex = 1;
  pageSize = 10;
  total = 0;
  listOfData = [];
  loading = true;
  isVisibleItemModal = false;
  itemForm: FormGroup;
  isItemModalBoardNumberExists = false;

  // New struct
  isAircraftFormModalVisible = false;
  isAircraftFormModalNMode = false;
  aircraftFormData: AircraftModel;

  constructor(private aircraftsService: AircraftsService, private messageService: NzMessageService,
              private formBuilder: FormBuilder) {}

  showAircraftNFormModal(): void {
    this.isAircraftFormModalNMode = true;
    this.isAircraftFormModalVisible = true;
    this.aircraftFormData = null;
  }

  showAircraftEFormModal(id: bigint, boardNumber: string, mark: string, model: string, type: string): void {
    this.isAircraftFormModalNMode = false;
    this.isAircraftFormModalVisible = true;
    const aircraftModel: AircraftModel = {
      id: id,
      boardNumber: boardNumber,
      mark: mark,
      model: model,
      type: type
    };
    this.aircraftFormData = aircraftModel;
  }

  cancelAircraftFormModal(): void {
    this.isAircraftFormModalVisible = false;
  }

  fetch(fromFirstPage: boolean = false): void {
    if (fromFirstPage) {
      this.pageIndex = 1;
    }
    this.loading = true;
    forkJoin(
      this.aircraftsService.total(),
      this.aircraftsService.fetch(this.pageIndex, this.pageSize),
    ).subscribe(([total, aircrafts]) => {
      this.loading = false;
      this.total = Number(total.value);
      this.listOfData = aircrafts;
    }, () => {
      this.loading = false;
      this.messageService.error('Данные от сервера не могут быть получены');
    });
  }

  delete(id: bigint): void {
    this.loading = true;
    this.aircraftsService.delete(id).subscribe(() => {
      forkJoin(
        this.aircraftsService.total(),
        this.aircraftsService.fetch(this.pageIndex, this.pageSize),
      ).subscribe(([total, aircrafts]) => {
        this.loading = false;
        this.total = Number(total.value);
        this.listOfData = aircrafts;
        this.messageService.success('Операция успешно выполнена');
      }, () => {
        this.loading = false;
        this.total = 0;
        this.listOfData = [];
        this.messageService.error('Операция не может быть выполнена');
      });
    }, () => {
      this.loading = false;
      this.total = 0;
      this.listOfData = [];
      this.messageService.error('Операция не может быть выполнена');
    });
  }

  ngOnInit(): void {
    this.fetch();
  }
}
