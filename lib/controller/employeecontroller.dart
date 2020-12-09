import '../common/packages.dart';

CollectionReference employees = FirebaseFirestore.instance.collection('employees');

createEmployee(fname, lname, email, phonenum, license, type) {
  return employees
          .add({
            'fname': fname,
            'lname': lname,
            'email': email,
            'license_number': license,
            'phone_number': phonenum,
            'type': type,
            'deleted': false
          })
          .then((value) => print("Employee Added"))
          .catchError((error) => print("Failed to add operator: $error"));
}

