import '../common/packages.dart';

CollectionReference terminals = FirebaseFirestore.instance.collection('terminals');

// ignore: non_constant_identifier_names
createTerminal(station_number,name, city, street, province, country) {
  return terminals
          .add({
            'name': name,
            'station_number': station_number,
            'city': city,
            'street': street,
            'province': province,
            'country': country,
            'deleted': false
          })
          .then((value) => print("Terminal Added"))
          .catchError((error) => print("Failed to add terminal: $error"));
}

