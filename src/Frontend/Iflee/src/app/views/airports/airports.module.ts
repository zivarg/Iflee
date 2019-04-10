import { NgModule } from '@angular/core';

import { AirportsComponent } from './airports.component';
import { AirportsRoutingModule } from './airports-routing.module';
import {NgZorroAntdModule} from 'ng-zorro-antd';
import {CommonModule} from '@angular/common';

@NgModule({
  imports: [
    CommonModule,
    AirportsRoutingModule,
    NgZorroAntdModule
  ],
  declarations: [ AirportsComponent ]
})
export class AirportsModule { }
