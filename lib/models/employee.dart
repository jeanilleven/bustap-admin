import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  String fname;
  String lname;
  String email;
  String phonenum;
  String type;
  String licensenum;
  bool status;
  String uid;
  DocumentReference employeeRef;

  Employee(
      {this.email,
      this.fname,
      this.licensenum,
      this.lname,
      this.phonenum,
      this.type,
      this.status,
      this.uid, 
      this.employeeRef});
}
