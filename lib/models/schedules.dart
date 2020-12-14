import 'package:bustap/common/packages.dart';

class Schedule {
  DateTime time;
  DocumentReference terminalId;
  String terminalcode;
  String type;
  String vehiclecode;
  DocumentReference vehicleid;
  bool status;
  String uid;

  Schedule(
      {this.time,
      this.terminalId,
      this.terminalcode,
      this.type,
      this.vehiclecode,
      this.vehicleid,
      this.status,
      this.uid,
      });
}
