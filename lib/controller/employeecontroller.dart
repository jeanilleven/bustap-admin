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

  updateEmployee(Employee em) {
    return employees.doc(em.uid).update({
      'fname': em.fname,
      'lname': em.lname,
      'email': em.email,
      'license_number': em.licensenum,
      'phone_number': em.phonenum,
      'type': em.type,
    }).then((value) => print("Employee updated")).catchError((e) => print("Failed to update employee: $e"));
  }

  deleteEmployee(Employee em){
    return employees.doc(em.uid).update({
      'deleted': true,
    }).then((value) => print("Employee deleted")).catchError((e) => print("Failed to delete employee: $e"));
  }

  List<Employee> _employeeList(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Employee(
            fname: doc.data()['fname'],
            lname: doc.data()['lname'],
            email: doc.data()['email'],
            phonenum: doc.data()['phone_number'],
            status: doc.data()['deleted'],
            licensenum: doc.data()['license_number'],
            type: doc.data()['type'], 
            uid: doc.id);
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





