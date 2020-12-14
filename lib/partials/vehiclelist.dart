import 'package:bustap/partials/schedule.dart';
import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../models/vehicle.dart';
import '../partials/vepartials.dart';

class VehicleList extends StatefulWidget {
  final String vehicleType;
  final DocumentSnapshot userDoc;
  final User userCred;
  VehicleList(this.userDoc, this.userCred, this.auth,{this.vehicleType}) : super();
  final Auth auth;

  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final vehicleSnapshot = Provider.of<List<Vehicle>>(context) ?? [];
    final vehicleDisplay = vehicleSnapshot.where((element) => element.type == widget.vehicleType && element.status == false).toList();
    return ListView.builder(
      itemCount: vehicleDisplay.length,
      itemBuilder: (context, index){
        return Container(
        margin: EdgeInsets.all(5),
        child: Material(
            elevation: 14,
            shadowColor: Colors.blueGrey,
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Expanded(
                  child: Text(vehicleDisplay[index].buscode, style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child:
                      Text(vehicleDisplay[index].platenum, style: TextStyle(fontSize: 16)),
                ),
                Spacer(),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        addVehicleForm(context, "View Vehicle Details", "Update", _formKey, vehicleDisplay[index]);
                      },
                      tooltip: 'View Details',
                      icon: Icon(CupertinoIcons.eye, color: Colors.blue[200]),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                       //some code here to go to calendar page
                       Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new ScheduleTable(widget.userDoc,
                                        widget.userCred, 
                                        widget.auth, 
                                        vType: widget.vehicleType.toLowerCase(),
                                        vCode: vehicleDisplay[index].buscode,
                                        busID:vehicleDisplay[index].vehicleRef)));
                      },
                      tooltip: 'View Schedule and Assignments',
                      icon: Icon(CupertinoIcons.calendar,
                          color: Colors.blue[200]),
                    )
                  ],
                ),
                Column(children: [
                  IconButton(
                    onPressed: () {
                      askConfirmation(context, vehicleDisplay[index]);
                    },
                    tooltip: 'Delete',
                    icon: Icon(CupertinoIcons.trash, color: Colors.red[200]),
                  )
                ])
              ]),
            )));
      }
      
    );
  }
}