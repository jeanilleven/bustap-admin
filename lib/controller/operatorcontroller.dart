import '../common/packages.dart';

CollectionReference operators = FirebaseFirestore.instance.collection('operators');

createOperator(fname, lname, email, phonenum, type) {
  return operators
          .add({
            'fname': fname,
            'lname': lname,
            'email': email,
            'phone_number': phonenum,
            'type': type,
            'deleted': false
          })
          .then((value) => print("Operator Added"))
          .catchError((error) => print("Failed to add operator: $error"));
}

