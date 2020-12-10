import '../common/packages.dart';
import '../models/operator.dart';

class OperatorController {
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

  List<Operator> _operatorList(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Operator(
            fname: doc.data()['fname'],
            lname: doc.data()['lname'],
            email: doc.data()['email'],
            phonenum: doc.data()['phonenum'],
            type: doc.data()['type']);
      }).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<List<Operator>> get retrieveAllOperators {
    try {
      print(operators.snapshots().map(_operatorList));
      return operators.snapshots().map(_operatorList);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

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

