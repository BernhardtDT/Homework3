import { Component, OnInit } from '@angular/core';
import { StudentService } from '../shared/student.service';
import { Router } from '@angular/router';
import { Student } from '../shared/student.model';
import { Subject } from '../shared/subject.model';

@Component({
  selector: 'app-subject',
  templateUrl: './subject.component.html',
  styleUrls: ['./subject.component.sass']
})
export class SubjectComponent implements OnInit {

  constructor(
    public studentservice: StudentService,
    private router: Router) { }

  ngOnInit(): void {
    this.resetForm();
    this.refreshList();
  }

  resetForm(){
    this.studentservice.subjectData = {
      Subject_ID: 0,
      Subject_Name: ''
    }
  }
  gotostudent() {
    this.router.navigate(['/student'])
  }
  refreshList() {
    this.studentservice.getSubjectList().then(res => this.studentservice.subjectList = res as Subject[]);
  }
  addsubject() {
    console.log(this.studentservice.subjectData);
    this.studentservice.addSubject(this.studentservice.subjectData).subscribe(res => {
      console.log(res);
      this.resetForm();
      this.refreshList();
    });
  }

onDeleteSubjectItem(id: number){
  console.log(id);
  if (confirm('Sure')) {
    this.studentservice.deleteSubject(id).subscribe(res => {
      console.log(res);
      this.resetForm();
      this.refreshList();
    });
  }
}
onEditSubjectItem(objSubject: Subject){
  this.resetForm();
  this.refreshList();
  console.log(objSubject);
  this.studentservice.subjectData.Subject_ID = objSubject.Subject_ID;
  this.studentservice.subjectData.Subject_Name = objSubject.Subject_Name;

} 

updateSubject(){
  this.studentservice.putSubject(this.studentservice.subjectData).subscribe(res=>{
    console.log(res);
    this.refreshList();
    this.resetForm();
  })
}
}
