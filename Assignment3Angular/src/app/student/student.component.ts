import { Component, OnInit } from '@angular/core';
import { StudentService } from '../shared/student.service';
import { Router } from '@angular/router';
import { Student } from '../shared/student.model';

@Component({
  selector: 'app-student',
  templateUrl: './student.component.html',
  styleUrls: ['./student.component.sass']
})
export class StudentComponent implements OnInit {

  constructor(
    public studentservice: StudentService,
    private router: Router) { }

  ngOnInit(): void {
    this.resetForm();
    this.refreshList();
  }
refreshList(){
  this.studentservice.getStudentList().then(res => this.studentservice.studentList = res as Student[]);
}
  resetForm(){
    this.studentservice.studentData = {
      Student_ID: 0,
      Student_Name: '',
      Student_Number: '',
      Student_Surname: ''
    }
  }
  gotosubject() {
    this.router.navigate(['/subject'])
  }
  addstudent(){
    console.log(this.studentservice.studentData);
    this.studentservice.addStudent(this.studentservice.studentData).subscribe(res=>{
      console.log(res);
      this.resetForm();
      this.refreshList();
    });
}

onDeleteStudentItem(id: number){
  console.log(id);
  if (confirm('Sure')) {
    this.studentservice.deleteStudent(id).subscribe(res => {
      console.log(res);
      this.resetForm();
      this.refreshList();
    });
  }
  }
  onEditStudentItem(obj: Student) {
    this.resetForm();
    this.refreshList();
    console.log(obj);
    this.studentservice.studentData.Student_ID = obj.Student_ID;
    this.studentservice.studentData.Student_Name = obj.Student_Name;
    this.studentservice.studentData.Student_Surname = obj.Student_Surname;
    this.studentservice.studentData.Student_Number = obj.Student_Number;
  } 

  onViewGrade(objStud: Student) {
    this.router.navigate(['/grade']);
    this.studentservice.studentData = objStud;
  }

  updateStudent() {
    this.studentservice.putStudent(this.studentservice.studentData).subscribe(res => {
      console.log(res);
      this.refreshList();
      this.resetForm();
    })
  }
}
