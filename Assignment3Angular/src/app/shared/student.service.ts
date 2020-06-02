import { Injectable } from '@angular/core';
import { Student } from './student.model';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Subject } from './subject.model';
import { User } from './user.model';
import { Data } from '@angular/router';
import { Grade } from './grade.model';

@Injectable({
  providedIn: 'root'
})
export class StudentService {
  studentData: Student; 
  subjectData: Subject;
  userData: User;
  gradeData: Data;
  studentList: Student[];
  subjectList: Subject[];
  gradeList: Grade[];
  StudentId: number;
  StudentName: string;
  StudentSurname: string;
  StudentNumber: string;

  constructor(private http: HttpClient) { }

//students
  addStudent(obj: Student){
    return this.http.post(environment.apiURL + '/Students', obj);
  }
  getStudentList() {
    return this.http.get(environment.apiURL + '/Students').toPromise();
  }
  getUsertList() {
    return this.http.get(environment.apiURL + '/User').toPromise();
  }
  deleteStudent(id: number) {
    return this.http.delete(environment.apiURL + '/Students/' + id);
  }
  putStudent(obj: Student) {
    return this.http.put(environment.apiURL + '/Students/' + obj.Student_ID, obj);
  }
//subjects
  getSubjectList() {
    return this.http.get(environment.apiURL + '/Subjects').toPromise();
  }
  addSubject(objSubject: Subject) {
    return this.http.post(environment.apiURL + '/Subjects', objSubject);
  }
  deleteSubject(id: number){
  return this.http.delete(environment.apiURL + '/Subjects/' + id);
  }
  putSubject(objSubject: Subject){
  return this.http.put(environment.apiURL + '/Subjects/' + objSubject.Subject_ID, objSubject);
  } 
  //Grades
  getGradeList() {
    return this.http.get(environment.apiURL + '/Grades').toPromise();
  }

  deleteStudentSubjectGrade(id: number)
  {
    return this.http.delete(environment.apiURL + '/Grades/' + id);
  }

  addMark(objGrade: Grade) {
    return this.http.post(environment.apiURL + '/Grades', objGrade);
  }

}
