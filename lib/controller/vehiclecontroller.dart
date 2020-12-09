import '../common/packages.dart';

CollectionReference vehicles = FirebaseFirestore.instance.collection('buses');

// ignore: non_constant_identifier_names
createVehicle(bus_code, capacity, plate_number, manufacturer, type) {
  return vehicles
          .add({
            'bus_code': bus_code,
            'capacity': capacity,
            'plate_number': plate_number,
            'manufacturer': manufacturer,
            'seats_taken': 0,
            'type': type,
            'deleted': false
          })
          .then((value) => print("Vehicle Added"))
          .catchError((error) => print("Failed to add operator: $error"));
}

