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

  List<Terminal> _terminalList(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Terminal(
            city: doc.data()['city'],
            country: doc.data()['country'],
            name: doc.data()['name'],
            province: doc.data()['province'],
            stationnum: doc.data()['station_number'],
            status: doc.data()['deleted'],
            street: doc.data()['street']);
      }).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<List<Terminal>> get retrieveAllTerminals {
    try {
      print(terminals.snapshots().map(_terminalList));
      return terminals.snapshots().map(_terminalList);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}


