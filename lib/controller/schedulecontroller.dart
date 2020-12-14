import 'package:bustap/models/terminal.dart';

import '../common/packages.dart';
import '../models/schedules.dart';


class ScheduleController {
  CollectionReference schedules = FirebaseFirestore.instance.collection('busSchedules');
  createSchedule(Schedule sched, Terminal terminal) {
  return schedules
    .add({
        'datetime': sched.time,
        'terminal_code':sched.terminalcode,
        'terminal_id': terminal.termRef,
        'type': sched.type,
        'vehicle_code': sched.vehiclecode,
        'vehicle_id':sched.vehicleid,
        'deleted': false
      })
      .then((value) => print("Schedule Added"))
      .catchError((error) => print("Failed to add schedule: $error"));
  }

  updateSchedule(Schedule sc, Terminal terminal) {
    return schedules.doc(sc.uid).update({
      'datetime': sc.time,
      'terminal_code': sc.terminalcode,
      'terminal_id':terminal.termRef,
    }).then((value) => print("Schedule updated")).catchError((e) => print("Failed to update schedule: $e"));
  }

  deleteSchedule(Schedule sc){
    return schedules.doc(sc.uid).update({
      'deleted': true,
    }).then((value) => print("Schedule deleted")).catchError((e) => print("Failed to delete schedule: $e"));
  }

  List<Schedule> _scheduleList(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Schedule(
            time: doc.data()['datetime'].toDate(),
            terminalId: doc.data()['terminal_id'],
            terminalcode: doc.data()['terminal_code'],
            type: doc.data()['type'],
            vehiclecode: doc.data()['vehicle_code'],
            status:doc.data()['deleted'],
            vehicleid: doc.data()['vehicle_id'],
            uid:doc.id,
          );
      }).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Stream<List<Schedule>> get retrieveAllSchedules {
    try {
      print(schedules.snapshots().map(_scheduleList));
      return schedules.snapshots().map(_scheduleList);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}