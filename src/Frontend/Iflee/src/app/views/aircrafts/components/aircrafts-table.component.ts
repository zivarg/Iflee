import {Component, OnInit} from '@angular/core';
import {AircraftsService} from '../../../services/aircrafts.service';
import {forkJoin} from 'rxjs/internal/observable/forkJoin';
import {NzMessageService} from 'ng-zorro-antd';
import {AbstractControl, FormBuilder, FormGroup, Validators} from '@angular/forms';

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
  editId = -1;
  itemForm: FormGroup;
  isItemModalBoardNumberValidation = false;
  isItemModalBoardNumberExists = false;

  constructor(private aircraftsService: AircraftsService, private messageService: NzMessageService,
              private formBuilder: FormBuilder) {}

  itemModalOk(): void {
    this.isVisibleItemModal = false;
  }

  editIndex(id: number): number {
    if (id === -1) {
      return -1;
    }
    for (let i = 0; i < this.listOfData.length; i++) {
      if (this.listOfData[i].id === id) {
        return i;
      }
    }
    return -1;
  }

  isItemModalBoardNumberValid(): boolean {
    return this.itemForm.get('boardNumber').dirty && !this.itemForm.get('boardNumber').errors && !this.isItemModalBoardNumberExists;
  }

  isItemModalDataValid(): boolean {
    return this.isItemModalBoardNumberValid();
  }

  itemModalCancel(): void {
    this.editId = -1;
    this.isVisibleItemModal = false;
  }

  showItemModal(id: number = -1): void {
    this.itemForm.reset();
    if (id !== -1) {
      const listItem = this.listOfData[this.editIndex(id)];
      this.itemForm.patchValue({
        boardNumber: listItem.boardNumber
      });
    }
    this.editId = id;
    this.isVisibleItemModal = true;
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
    this.itemForm = this.formBuilder.group({
      boardNumber: [null, [Validators.required]]
    });
    this.itemForm.controls['boardNumber'].valueChanges.subscribe(
      (value) => {
        this.isItemModalBoardNumberExists = false;
        if (value === '') {
          return;
        }
        if ( this.editId !== -1) {
          const listItem = this.listOfData[this.editIndex(this.editId)];
          if (value === listItem.boardNumber) {
            return;
          }
        }
        this.isItemModalBoardNumberValidation = true;
        this.aircraftsService.isBoardNumberExists(value).subscribe((result) => {
          this.isItemModalBoardNumberExists = result.value;
          this.isItemModalBoardNumberValidation = false;
        },() => {
          this.isItemModalBoardNumberValidation = false;
          this.messageService.error('Операция поиска бортового номера не может быть выполнена');
        });
      }
    );
    this.fetch();
  }
}
