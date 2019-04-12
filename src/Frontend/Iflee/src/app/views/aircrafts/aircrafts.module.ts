import { NgModule } from '@angular/core';

import { AircraftsComponent } from './aircrafts.component';
import {NgZorroAntdModule} from 'ng-zorro-antd';
import {CommonModule} from '@angular/common';
import {AircraftsRoutingModule} from './aircrafts-routing.module';
import {AircraftsTableComponent} from './components/aircrafts-table.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {AircraftFormModalComponent} from './components/aircraft-form-modal.component';
import {AircraftFormComponent} from './components/aircraft-form.component';
import {AircraftFormBoardNumberComponent} from './components/aircraft-form-board-number.component';
import {AircraftFormMarkComponent} from './components/aircraft-form-mark.component';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    AircraftsRoutingModule,
    NgZorroAntdModule
  ],
  declarations: [ AircraftsComponent, AircraftsTableComponent, AircraftFormModalComponent, AircraftFormComponent,
    AircraftFormBoardNumberComponent, AircraftFormMarkComponent ]
})
export class AircraftsModule { }
