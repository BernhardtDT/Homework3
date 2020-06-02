import { Component, OnInit } from '@angular/core';
import { StudentService } from '../shared/student.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.sass']
})
export class RegisterComponent implements OnInit {

  constructor(
    public studentservice: StudentService) { }

  ngOnInit(): void {
    this.resetForm();
  }

  resetForm(){
    this.studentservice.userData = {
      User_ID: 0,
      Username: '',
      Password: '',
    }
  }
}
