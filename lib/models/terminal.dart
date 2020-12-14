import 'package:bustap/common/packages.dart';

class Terminal {
  String city;
  String country;
  String name;
  String province;
  String stationnum;
  String street;
  bool status;
  String uid;
  DocumentReference termRef;
  Terminal(
      {this.city,
      this.country,
      this.name,
      this.province,
      this.stationnum,
      this.street,
      this.status,
      this.uid,
      this.termRef,
      });
}
