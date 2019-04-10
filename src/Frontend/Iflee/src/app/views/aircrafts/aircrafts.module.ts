import { NgModule } from '@angular/core';

import { AircraftsComponent } from './aircrafts.component';
import {NgZorroAntdModule} from 'ng-zorro-antd';
import {CommonModule} from '@angular/common';
import {AircraftsRoutingModule} from './aircrafts-routing.module';
import {AircraftsTableComponent} from './components/aircrafts-table.component';

@NgModule({
  imports: [
    CommonModule,
    AircraftsRoutingModule,
    NgZorroAntdModule
  ],
  declarations: [ AircraftsComponent, AircraftsTableComponent ]
})
export class AircraftsModule { }
