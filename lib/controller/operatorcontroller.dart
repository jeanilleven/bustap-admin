import '../common/packages.dart';
import '../models/operator.dart';

class OperatorController {
  CollectionReference operators = FirebaseFirestore.instance.collection('operators');
  createOperator(Operator op) {
    return operators
        .add({
          'fname': op.fname,
          'lname': op.lname,
          'email': op.email,
          'phone_number': op.phonenum,
          'type': op.type,
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
            phonenum: doc.data()['phone_number'],
            status: doc.data()['deleted'],
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
