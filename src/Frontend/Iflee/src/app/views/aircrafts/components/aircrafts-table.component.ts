import {Component, OnInit} from '@angular/core';
import {AircraftsService} from '../../../services/aircrafts.service';
import {forkJoin} from 'rxjs/internal/observable/forkJoin';
import {NzMessageConfig, NzMessageService} from 'ng-zorro-antd';

@Component({
  selector: 'aircrafts-table',
  providers: [AircraftsService],
  template: `    
    <button nz-button nzType="primary" [disabled]="loading">Добавить новый самолет</button>
    <button nz-button nzType="default" [disabled]="loading" (click)="fetch()">Обновить</button>
    <nz-table 
      #ajaxTable 
      nzShowSizeChanger 
      [nzFrontPagination]="false" 
      [nzData]="listOfData" 
      [nzLoading]="loading" 
      [nzTotal]="total" 
      [(nzPageIndex)]="pageIndex" 
      [(nzPageSize)]="pageSize" 
      (nzPageIndexChange)="fetch()" 
      (nzPageSizeChange)="fetch(true)"
    >
      <thead>
        <tr>
          <th>Бортовой номер</th>
          <th>Марка</th>
          <th>Модель</th>
          <th>Тип</th>
          <th>Действие</th>
        </tr>
      </thead>
      <tbody>
        <tr *ngFor="let data of ajaxTable.data">
          <td>{{ data.boardNumber }}</td>
          <td>{{ data.mark }}</td>
          <td>{{ data.model }}</td>
          <td>{{ data.type }}</td>
          <td>
            <button nz-button nzType="default">Редактировать</button>
            <a nz-popconfirm
               nzTitle="Вы уверены, что хотите удалить?"
               nzOkText="Да"
               nzCancelText="Нет" (nzOnConfirm)="delete(data.id)"
            >
              <button nz-button nzType="danger">Удалить</button>
            </a>
          </td>
        </tr>
      </tbody>
    </nz-table>
  `,
  styles: [
    `
      [nz-button] {
        margin-right: 8px;
        margin-bottom: 12px;
      }
    `
  ]
})

export class AircraftsTableComponent implements OnInit {
  pageIndex = 1;
  pageSize = 10;
  total = 0;
  listOfData = [];
  loading = true;

  constructor(private aircraftsService: AircraftsService, private messageService: NzMessageService) {}

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
        this.messageService.error('Операция не может быть выполнена выполнена');
      });
    }, () => {
      this.messageService.error('Операция не может быть выполнена выполнена');
    });
  }

  ngOnInit(): void {
    this.fetch();
  }
}
