import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../models/vehicle.dart';
import '../partials/partials.dart';

class VehicleList extends StatefulWidget {
  final String vehicleType;
  VehicleList({this.vehicleType}) : super();

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
                        addVehicleForm(context, "Add Vehice", "Add", _formKey, vehicleDisplay[index]);
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
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ScheduleTable()));
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
                      // askConfirmation(context, vehicle);
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