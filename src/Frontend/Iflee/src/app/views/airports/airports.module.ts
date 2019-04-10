import { NgModule } from '@angular/core';

import { AirportsComponent } from './airports.component';
import { AirportsRoutingModule } from './airports-routing.module';
import {NzButtonModule} from 'ng-zorro-antd';

@NgModule({
  imports: [
    AirportsRoutingModule,
    NzButtonModule
  ],
  declarations: [ AirportsComponent ]
})
export class AirportsModule { }
