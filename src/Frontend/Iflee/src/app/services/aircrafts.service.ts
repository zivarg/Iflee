import { HttpClient, HttpParams } from '@angular/common/http';
import { Component, Injectable, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import {AircraftModel} from '../models/aircraft.model';
import {AircraftsTotalModel} from '../models/aircrafts-total.model';

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

  constructor(private http: HttpClient) {}
}
