import { HttpClient, HttpParams } from '@angular/common/http';
import { Component, Injectable, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import {AircraftModel} from '../models/aircraft.model';
import {AircraftsTotalModel} from '../models/aircrafts-total.model';
import {AircraftsIsBoardNumberExists} from '../models/aircrafts-is-board-number-exists';

@Injectable()
export class AircraftsService {
  apiAircraftsUrl = '/api/aircrafts';

  fetch(
    pageIndex: number = 1,
    pageSize: number = 10,
  ): Observable<AircraftModel[]> {
    const params = new HttpParams()
      .append('limitOffset', `${(pageIndex - 1) * pageSize}`)
      .append('limitRowCount', `${pageSize}`);
    return this.http.get<AircraftModel[]>(`${this.apiAircraftsUrl}`, { params });
  }

  total(): Observable<AircraftsTotalModel> {
    return this.http.get<AircraftsTotalModel>(`${this.apiAircraftsUrl}/total`);
  }

  isBoardNumberExists(boardNumber: string): Observable<AircraftsIsBoardNumberExists> {
    const params = new HttpParams()
      .append('boardNumber', `${boardNumber}`);
    return this.http.get<AircraftsIsBoardNumberExists>(`${this.apiAircraftsUrl}/is-board-number-exists`, {params});
  }

  delete(id: bigint): Observable<{}> {
    return this.http.delete<{}>(`${this.apiAircraftsUrl}/${id}`);
  }

  constructor(private http: HttpClient) {}
}
