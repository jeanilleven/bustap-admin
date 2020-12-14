import 'package:bustap/partials/empartials.dart';
import 'package:bustap/partials/partials.dart';
import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../models/schedules.dart';
import 'package:intl/intl.dart';
// import 'employeeform.dart';

class ScheduleList extends StatefulWidget {
  final DocumentReference busID;
  @override
  ScheduleList({this.busID}) : super();
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final scheduleSnapshot = Provider.of<List<Schedule>>(context) ?? [];
    final scheduleDisplay = scheduleSnapshot.where((element) => element.vehicleid == widget.busID 
                                                          && element.status == false).toList();
    return ListView.builder(
      itemCount: scheduleDisplay.length,
      itemBuilder: (context, index){
        var displayTime = new DateFormat.jm().format(scheduleDisplay[index].time).toString();
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
                              scheduleDisplay[index].terminalcode,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20)),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                              displayTime,
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
                                addScheduleForm(context, 
                                      "View Schedule Details", 
                                      "Update", 
                                      _formKey,
                                      scheduleDisplay[index]);
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
                              askScheduleConfirmation(context, scheduleDisplay[index]);
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
