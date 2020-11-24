import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';

class Vehicles extends StatelessWidget {
  const Vehicles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Vehicles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VehiclesPage(title: 'BusTap Admin | Vehicles'),
    );
  }
}

class VehiclesPage extends StatefulWidget {
  VehiclesPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VehiclesPageState createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  List<VehicleDetails> buses = [
    new VehicleDetails('BUS001', 'ABC123'),
    new VehicleDetails('BUS002', 'ABC123'),
    new VehicleDetails('BUS003', 'ABC123'),
    new VehicleDetails('BUS004', 'ABC123'),
    new VehicleDetails('BUS005', 'ABC123'),
    new VehicleDetails('BUS006', 'ABC123'),
    new VehicleDetails('BUS007', 'ABC123'),
    new VehicleDetails('BUS008', 'ABC123'),
    new VehicleDetails('BUS009', 'ABC123'),
    new VehicleDetails('BUS0010', 'ABC123'),
    new VehicleDetails('BUS0011', 'ABC123'),
  ];

  List<VehicleDetails> jeeps = [
    new VehicleDetails('JEEP001', 'ABC123'),
    new VehicleDetails('JEEP002', 'ABC123'),
    new VehicleDetails('JEEP003', 'ABC123'),
    new VehicleDetails('JEEP004', 'ABC123'),
    new VehicleDetails('JEEP005', 'ABC123'),
    new VehicleDetails('JEEP006', 'ABC123'),
    new VehicleDetails('JEEP007', 'ABC123'),
    new VehicleDetails('JEEP008', 'ABC123'),
    new VehicleDetails('JEEP009', 'ABC123'),
    new VehicleDetails('JEEP0010', 'ABC123'),
    new VehicleDetails('JEEP0011', 'ABC123'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: MainDrawer(),
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
        body: TabBarView(
          children: [
            Container(
                color: Colors.grey[250],
                child: Padding(
                    padding: EdgeInsets.all(50),
                    child: ListView(
                      children: buses.map((bus) => listvehicle(bus)).toList(),
                    ))),
            Container(
                padding: EdgeInsets.all(30),
                color: Colors.grey[250],
                child: Padding(
                    padding: EdgeInsets.all(50),
                    child: ListView(
                      children: jeeps.map((jeep) => listvehicle(jeep)).toList(),
                    ))),
          ],
        ),
      ),
    );
  }

  Container listvehicle(vehicle) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: ListTile(
            onTap: (){},
            leading: CircleAvatar(),
            title: Text(vehicle.id),
            subtitle: Text(vehicle.platenumber),
            trailing: IconButton(
              tooltip: 'Delete',
                icon: Icon(CupertinoIcons.trash, color: Colors.red),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     new MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             new DriverDetails()));
                }),
            tileColor: Colors.white,
          ),
        ));
  }
}

// List<VehicleDetails>
// List<VehicleDetails> populateVehicleDetails(String type) {
//   List<VehicleDetails> vehicle;
//   String id;
//   for (var x = 0; x < 10; x++) {
//     id = type + '00' + x.toString();
//     vehicle.add(new VehicleDetails(id, 'ABCD123'));
//   }

//   return vehicle;
// }

class VehicleDetails {
  String id;
  String platenumber;
  VehicleDetails(this.id, this.platenumber);
}
