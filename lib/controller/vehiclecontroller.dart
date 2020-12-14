import '../common/packages.dart';
import '../models/vehicle.dart';

class VehicleController{
  CollectionReference vehicles = FirebaseFirestore.instance.collection('buses');

  // ignore: non_constant_identifier_names
  createVehicle(Vehicle ve) {
    return vehicles
        .add({
          'bus_code': ve.buscode,
          'capacity': ve.capacity,
          'plate_number': ve.platenum,
          'manufacturer': ve.manufacturer,
          'seats_taken': 0,
          'type': ve.type,
          'deleted': false
        })
        .then((value) => print("Vehicle Added"))
        .catchError((error) => print("Failed to add operator: $error"));
  }

  updateVehicle(Vehicle ve) {
    return vehicles.doc(ve.uid).update({
      'bus_code': ve.buscode,
      'capacity': ve.capacity,
      'manufacturer': ve.manufacturer,
      'plate_number': ve.platenum, 
      'route': ve.route, 
      'seats_taken': ve.seatstaken, 
      'type': ve.type
    }).then((value) => print("Vehicle updated")).catchError((e) => print("Failed to update vehicle: $e"));
  }

  deleteVehicle(Vehicle ve){
    return vehicles.doc(ve.uid).update({
      'deleted': true,
    }).then((value) => print("Vehicle deleted")).catchError((e) => print("Failed to delete vehicle: $e"));
  }

  List<Vehicle> _vehicleList(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Vehicle(
            buscode: doc.data()['bus_code'],
            capacity: doc.data()['capacity'],
            manufacturer: doc.data()['manufacturer'],
            platenum: doc.data()['plate_number'],
            route: doc.data()['route'],
            status: doc.data()['deleted'],
            seatstaken: doc.data()['seats_taken'],
            type: doc.data()['type'], 
            uid: doc.id, 
            vehicleRef: doc.reference);
            // status: doc.data()['deleted'];
      }).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<List<Vehicle>> get retrieveAllVehicles {
    try {
      print(vehicles.snapshots().map(_vehicleList));
      return vehicles.snapshots().map(_vehicleList);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}





// retrieveVehicle() async {
//   QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection("collection").get();

//   querySnapshot.docs.forEach((element) {
//     print(element.id);
//   });

//   return querySnapshot;
// }
