import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/vehiclecontroller.dart';
import '../models/vehicle.dart';
import '../partials/partials.dart';
import '../partials/vepartials.dart';

import 'package:bustap/services/auth.dart';

class Vehicles extends StatelessWidget {
  const Vehicles(this.userDoc, this.userCred, this.auth, {Key key})
      : super(key: key);
  final Auth auth;
  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Vehicles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VehiclesPage(userDoc, userCred, auth,
          title: 'BusTap Admin | Vehicles'),
    );
  }
}

class VehiclesPage extends StatefulWidget {
  VehiclesPage(this.userDoc, this.userCred, this.auth, {Key key, this.title})
      : super(key: key);
  final String title;
  final Auth auth;

  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  _VehiclesPageState createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  askConfirmation(BuildContext context, object) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Removal Confirmation'),
              content: Text('Are you sure you want to remove ' +
                  object.id +
                  ' from the list of vehicles?'),
              actions: [
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop(removeVehicle(object));
                  },
                )
              ]);
        });
  }

  removeVehicle(object) {
    setState(() {
      if (object.type == 1) {
        // buses.remove(object);
      } else {
        // jeeps.remove(object);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(widget.userDoc, widget.userCred, widget.auth),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.teal),
          title: Text("Vehicles",
              style: TextStyle(color: Colors.lightBlue, fontSize: 20)),
          bottom: TabBar(
            labelColor: Colors.blue,
            labelStyle: TextStyle(fontSize: 15),
            tabs: [
              Tab(
                text: 'Bus',
                icon: Icon(Icons.directions_car, color: Colors.blue),
              ),
              Tab(
                  text: 'Jeep',
                  icon: Icon(Icons.directions_transit, color: Colors.blue)),
            ],
          ),
        ),
        body: StreamProvider<List<Vehicle>>.value(
          value: VehicleController().retrieveAllVehicles,
          child: TabBarView(
            children: [
              Container(
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: VehicleList(vehicleType: "Bus"))),
              Container(
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: VehicleList(vehicleType: "Jeepney"))),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add a new vehicle',
            onPressed: () {
              Vehicle vehicle = new Vehicle(
                  buscode: '',
                  capacity: 0,
                  manufacturer: '',
                  platenum: '',
                  route: '',
                  seatstaken: 0,
                  type: '');
              addVehicleForm(context, "Add Vehicle", "Add", _formKey, vehicle);
            },
            child: Icon(CupertinoIcons.add)),
      ),
    );
  }
}
