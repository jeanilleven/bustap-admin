import '../common/packages.dart';
import '../models/schedules.dart';

class ScheduleController {
  CollectionReference schedules = FirebaseFirestore.instance.collection('busSchedules');
  List<Schedule> _scheduleList(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Schedule(
            time: doc.data()['datetime'].toString(),
            terminal: doc.data()['terminal_id'].toString(),
            type: doc.data()['type'],
            vehiclecode: doc.data()['vehicle_code'],
            vehicleid: doc.data()['vehicle_id'].toString(),
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