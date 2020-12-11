import '../common/packages.dart';
import '../models/terminal.dart';

class TerminalController{
  CollectionReference terminals = FirebaseFirestore.instance.collection('terminals');
  // ignore: non_constant_identifier_names
  createTerminal(Terminal term) {
  return terminals
    .add({
        'name': term.name,
        'station_number': term.stationnum,
        'city': term.city,
        'street': term.street,
        'province': term.province,
        'country': term.country,
        'deleted': false
      })
      .then((value) => print("Terminal Added"))
      .catchError((error) => print("Failed to add terminal: $error"));
  }
  // List<Terminal> _terminalList(QuerySnapshot snapshot) {
  //   try {
  //     return snapshot.docs.map((doc) {
  //       return Terminal(
  //           name: doc.data()['name'],
  //           stationnum: doc.data()['stationnum'],
  //           email: doc.data()['email'],
  //           phonenum: doc.data()['phonenum'],
  //           licensenum: doc.data()['licensenum'],
  //           type: doc.data()['type']);
  //     }).toList();
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}


