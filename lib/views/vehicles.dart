import 'package:bustap/views/dashboard.dart';
import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
  String _vType = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _vehicleNum, _plateNum, _make, initial, _opt;
  int _seatCnt;
    addVehicle(BuildContext context, String header, String option, VehicleDetails v){
    _opt = option;   
    return showDialog(context: context, builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        
        child: Form(
          key:_formKey,
          child: Container(
          height: 540,
          width: 550,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
            child: IntrinsicWidth(              
              child: ListView(
              children: [
                Text(header,
                  textAlign: TextAlign.center,
                  style: TextStyle(  
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                  ) 
                ),
                Divider(height:15,color: Colors.white),
                Divider(height:5,color: Colors.grey[300]),
                Divider(height:5,color: Colors.white),
                Container(
                  height: 75,
                  child: TextFormField(
                    controller: TextEditingController(text: v.id),
                    decoration: InputDecoration( 
                      labelText: "Vehicle Number",
                      hintText: v.id,
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => input.length < 1 ? 'This field is required' : null,
                    onSaved: (input) => _vehicleNum = input,
                  ),
                ),
                Container(
                  height: 75,
                  child: TextFormField(
                    controller: TextEditingController(text: v.platenumber),
                    decoration: InputDecoration( 
                      labelText: "Plate Number",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => input.length != 6 ? 'Invalid Plate Number' : null,
                    onSaved: (input) => _plateNum = input,
                  ),
                ),
                Container(
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration( 
                      labelText: 'Vehicle Manufacturer',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => input.length < 1 ? 'This field is required' : null,
                    onSaved: (input) => _make = input,
                  ),
                ),
                Container(
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration( 
                      labelText: 'Maximum Seat Capacity',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => input.length < 1 ? 'This field is required' : null,
                    onSaved: (input) => _seatCnt = int.parse(input),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child:DropdownSearch(
                      dialogMaxWidth: 500,
                      maxHeight: 100,
                      items: ["Bus", "Jeepney"],
                      label: "Vehicle Type",
                      // onChanged: print,
                      hint:"Vehicle",
                      showClearButton: true,
                      validator: (String item) {
                        if (item == null)
                          return "Invalid Vehicle";
                        else
                          return null;
                      },
                      onSaved: (input) => _vType = input,
                    ),
                ),
                Divider(height:25,color: Colors.white),
                Container(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }
                      ),
                      RaisedButton(
                        color: Colors.lightBlue,
                        child: Text(
                          option,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: _submit,
                      )
                    ],
                  ),
                ),
              ]
            ))
          ),
        ),
        )
      );
    });
  }
  void _submit()
  {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      setState(() {
        if(_opt=="Update"){
          //some update code here
        }else{
          //this adds to the list
          VehicleDetails newVehicle = new VehicleDetails(_vehicleNum, _plateNum);
          if(_vType == "Bus"){
            buses.add(newVehicle);
          }else{
            jeeps.add(newVehicle);
          }
        }
      });
      Navigator.of(context, rootNavigator: true).pop(context);
    }
  }
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
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: ListView(
                      children: buses.map((bus) => listvehicle(bus)).toList(),
                    ))),
            Container(
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: ListView(
                      children: jeeps.map((jeep) => listvehicle(jeep)).toList(),
                    ))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add a new vehicle',
            onPressed: () {
              VehicleDetails vehicle = new VehicleDetails('',''); 
              addVehicle(context, "Add Vehice", "Add", vehicle);
            },
            child: Icon(CupertinoIcons.add)),
      ),
    );
  }

  Container listvehicle(vehicle) {
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
                  child: Text(vehicle.id, style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child:
                      Text(vehicle.platenumber, style: TextStyle(fontSize: 16)),
                ),
                Spacer(),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        addVehicle(context, "View Vehicle Details", "Update", vehicle);
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
                    onPressed: () {},
                    tooltip: 'Delete',
                    icon: Icon(CupertinoIcons.trash, color: Colors.red[200]),
                  )
                ])
              ]),
            )));
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
