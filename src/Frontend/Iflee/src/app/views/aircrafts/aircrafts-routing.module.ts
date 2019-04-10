import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AircraftsComponent } from './aircrafts.component';

const routes: Routes = [
  {
    path: '',
    component: AircraftsComponent,
    data: {
      title: 'Самолеты'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AircraftsRoutingModule {}
