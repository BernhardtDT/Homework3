import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from "../app/login/login.component";
import { RegisterComponent } from "../app/register/register.component";
import { StudentComponent } from "../app/student/student.component";
import { StudentgradeComponent } from "../app/studentgrade/studentgrade.component";
import { GradeComponent } from "../app/grade/grade.component";
import { SubjectComponent } from './subject/subject.component';


const routes: Routes = [
  {path: '' , component: LoginComponent},
  {path: 'register' , component: RegisterComponent},
  { path: 'student', component: StudentComponent },
  { path: 'subject', component: SubjectComponent },
  { path: 'grade', component: GradeComponent },
  { path: 'studentgrade', component: StudentgradeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
