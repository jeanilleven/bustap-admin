import '../common/packages.dart';
import '../models/employee.dart';

class EmployeeController{
  CollectionReference employees = FirebaseFirestore.instance.collection('employees');
  createEmployee(Employee em) {
  return employees
          .add({
            'fname': em.fname,
            'lname': em.lname,
            'email': em.email,
            'license_number': em.licensenum,
            'phone_number': em.phonenum,
            'type': em.type,
            'deleted': false
          })
          .then((value) => print("Employee Added"))
          .catchError((error) => print("Failed to add operator: $error"));
  }

  List<Employee> _employeeList(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Employee(
            fname: doc.data()['fname'],
            lname: doc.data()['lname'],
            email: doc.data()['email'],
            phonenum: doc.data()['phonenum'],
            licensenum: doc.data()['licensenum'],
            type: doc.data()['type']);
      }).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Stream<List<Employee>> get retrieveAllEmployees {
    try {
      print(employees.snapshots().map(_employeeList));
      return employees.snapshots().map(_employeeList);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}





