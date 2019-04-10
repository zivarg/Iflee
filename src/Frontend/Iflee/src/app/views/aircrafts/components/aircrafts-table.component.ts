import {Component, OnInit} from '@angular/core';
import {AircraftsService} from '../../../services/aircrafts.service';
import {forkJoin} from 'rxjs/internal/observable/forkJoin';

@Component({
  selector: 'aircrafts-table',
  providers: [AircraftsService],
  template: `
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
        </tr>
      </thead>
      <tbody>
        <tr *ngFor="let data of ajaxTable.data">
          <td>{{ data.boardNumber }}</td>
          <td>{{ data.mark }}</td>
          <td>{{ data.model }}</td>
          <td>{{ data.type }}</td>
        </tr>
      </tbody>
    </nz-table>
  `
})

export class AircraftsTableComponent implements OnInit {
  pageIndex = 1;
  pageSize = 10;
  total = 0;
  listOfData = [];
  loading = true;

  constructor(private aircraftsService: AircraftsService) {}

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
    });
  }

  ngOnInit(): void {
    this.fetch();
  }
}
