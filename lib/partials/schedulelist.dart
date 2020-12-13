import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../models/schedules.dart';
// import 'employeeform.dart';

class ScheduleList extends StatefulWidget {
  final String busID;
  @override
  ScheduleList({this.busID}) : super();
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    final scheduleSnapshot = Provider.of<List<Schedule>>(context) ?? [];
    final scheduleDisplay = scheduleSnapshot.where((element) => element.vehicleid == 'DocumentReference(buses/'+widget.busID+')' && element.status == false).toList();
    return ListView.builder(
      itemCount: scheduleDisplay.length,
      itemBuilder: (context, index){
        return Container(
            margin: EdgeInsets.all(5),
            child: Material(
                elevation: 14,
                shadowColor: Colors.blueGrey,
                borderRadius: BorderRadius.circular(24),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                              scheduleDisplay[index].terminal.toString(),
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20)),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                              scheduleDisplay[index].time.toString(),
                              style: TextStyle(fontSize: 20)),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(scheduleDisplay[index].vehiclecode,
                              style: TextStyle(fontSize: 16)),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                // addEmployeeForm(
                                //     context,
                                //     "View Employee Details",
                                //     "Update",
                                //     _formKey,
                                //     employeeDisplay[index]);
                              },
                              tooltip: 'View Schedule',
                              icon: Icon(CupertinoIcons.eye,
                                  color: Colors.blue[200]),
                            )
                          ],
                        ),
                        Column(children: [
                          IconButton(
                            onPressed: () {
                              // askConfirmation(context, drv);
                              // askEmConfirmation(
                              //     context, employeeDisplay[index]);
                              // EmployeeController().deleteEmployee(employeeDisplay[index]);
                            },
                            tooltip: 'Delete',
                            icon: Icon(CupertinoIcons.trash,
                                color: Colors.red[200]),
                          )
                        ])
                      ]),
                )));
      },
    );
  }
}
