import '../views/views.dart';
import 'package:bustap/services/auth.dart';
import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/schedulecontroller.dart';
import '../models/schedules.dart';
import 'vepartials.dart';

class ScheduleTable extends StatefulWidget {
  final String busID;
  final String vType;
  final String vCode;
  ScheduleTable(this.userDoc, this.userCred, this.auth, {this.vType, this.vCode, this.busID}) : super();
  final Auth auth;
  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  _ScheduleTableState createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {
  // CalendarController _controller;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = CalendarController();
  // }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.teal),
            title: Text("Schedules and Assignments",
                style: TextStyle(color: Colors.lightBlue, fontSize: 20)),
            leading: IconButton(
              icon: Icon(CupertinoIcons.arrow_left),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Vehicles(
                            widget.userDoc, widget.userCred, widget.auth)));
              },
            )),
        body: StreamProvider<List<Schedule>>.value(
            value: ScheduleController().retrieveAllSchedules,
            child: Container(
                color: Colors.grey[250],
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: ScheduleList(busID: widget.busID),
                ))),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add a new schedule',
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Schedule sched = new Schedule(time: DateTime.now(), 
                                            type: widget.vType, 
                                            vehiclecode: widget.vCode, 
                                            vehicleid: "DocumentReference(buses/"+widget.busID+")");
              addScheduleForm(context, "Assign Schedule", "Add", _formKey, sched);
            }));
  }
}
