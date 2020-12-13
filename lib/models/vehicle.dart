import 'package:cloud_firestore/cloud_firestore.dart';

class Vehicle {
  String buscode;
  int capacity;
  String manufacturer;
  String platenum;
  String route;
  int seatstaken;
  String type;
  bool status;
  String uid;
  DocumentReference vehicleRef;

  Vehicle(
      {this.buscode,
      this.capacity,
      this.manufacturer,
      this.platenum,
      this.route,
      this.seatstaken,
      this.type,
      this.status,
      this.uid, 
      this.vehicleRef});
}
