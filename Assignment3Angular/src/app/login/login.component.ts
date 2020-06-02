import { Component, OnInit } from '@angular/core';
import { StudentService } from '../shared/student.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.sass']
})
export class LoginComponent implements OnInit {

  constructor(
    public studentservice: StudentService,
    private router: Router) { }

  ngOnInit(): void {
    this.resetForm();
  }

  resetForm(){
    this.studentservice.userData = {
      User_ID: 0,
      Username: '',
      Password: ''
    }
  }

  gotostudent() {
    this.router.navigate(['/student'])
  }

}
