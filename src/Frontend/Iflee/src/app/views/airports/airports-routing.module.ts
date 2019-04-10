import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AirportsComponent } from './airports.component';

const routes: Routes = [
  {
    path: '',
    component: AirportsComponent,
    data: {
      title: 'Аэропорты'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AirportsRoutingModule {}
