import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Student } from '../shared/student.model';
import { StudentService } from '../shared/student.service';
import { Grade } from '../shared/grade.model';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
import { Subject } from '../shared/subject.model';
import { element } from 'protractor';

@Component({
  selector: 'app-grade',
  templateUrl: './grade.component.html',
  styleUrls: ['./grade.component.sass']
})
export class GradeComponent implements OnInit {
  StudentID: number;
  StudentName: string;
  StudentSurname: string;
  StudentNumber: string;
  GradeArray: Grade[];
  addGrade: Grade;

  constructor(
  public studentservice: StudentService,
  private router: Router) { }

  ngOnInit(): void {
    this.resetForm();
    this.StudentID=this.studentservice.studentData.Student_ID;
    this.StudentName=this.studentservice.studentData.Student_Name;
    this.StudentSurname=this.studentservice.studentData.Student_Surname;
    this.StudentNumber=this.studentservice.studentData.Student_Number;
    this.refreshList();
    }

    refreshList(){
      this.studentservice.getGradeList().then(res => this.studentservice.gradeList = res as Grade[]);
      this.studentservice.getSubjectList().then(res => this.studentservice.subjectList = res as Subject[]);
    }

    resetForm(){
      this.studentservice.gradeData = {
        Grade_ID: 0,
        Student_ID: 0,
        Subject_ID: 0,
        Grade_Mark: 0,
        Subject_Name: ''
      }
      this.addGrade = {
        Grade_ID: 0,
        Student_ID: 0,
        Subject_ID: 0,
        Grade_Mark: 0,
        Subject_Name: ''
      }

      this.resetGrades();
    }

    resetGrades() {
      this.GradeArray = [];
    }


    hi() {
      this.resetGrades();
      this.refreshList();
      var i: number;
      i = 0;
      this.studentservice.gradeList.forEach((element1) => {
        // console.log(element1.Subject_ID, element1.Subject_Name);
        if (element1.Student_ID === this.StudentID) {
          this.studentservice.subjectList.forEach((element2) => {
            if (element1.Subject_ID === element2.Subject_ID) {
              element1.Subject_Name = element2.Subject_Name;
              this.GradeArray.push(element1);
            }
          })
        }
      })
    }

    addMark() {
      this.addGrade.Grade_Mark = this.studentservice.gradeData.Grade_Mark;
      this.addGrade.Student_ID = this.StudentID;
      this.studentservice.addMark(this.addGrade).subscribe(res => {
        console.log(res);
        this.hi();
        this.resetForm();
        this.refreshList();
      })
    }

    selectSubjectType(ctrl) {
      if (ctrl.selectedIndex === 0) {
        this.addGrade.Subject_ID = 0;
      } else {
        this.addGrade.Subject_ID = this.studentservice.subjectList[ctrl.selectedIndex - 1].Subject_ID;
      }
    }
    gotostudent() {
      this.router.navigate(['/student'])
    }

    onDeleteGradeItem(id: number){
      console.log(id);
      if (confirm('Sure')) {
        this.studentservice.deleteStudentSubjectGrade(id).subscribe(res => {
          console.log(res);
          this.resetForm();
          this.refreshList();
        });
      }
  }
}
