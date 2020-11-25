import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
import '../views/views.dart';

class Drivers extends StatelessWidget {
  const Drivers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusTap Admin | Drivers',
      theme: ThemeData(primaryColor: Colors.blue),
      home: DriversPage(title: 'BusTap Admin | Drivers'),
    );
  }
}

class DriversPage extends StatefulWidget {
  DriversPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DriversPageState createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  var _currentSelected;
  var vehicles = ["Bus", "Jeepney"];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _firstName, _lastName, _email, _fullName;
  addDriver(BuildContext context, String header, String option){
    // TextEditingController customerController = TextEditingController();
    return showDialog(context: context, builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Form(
          key:_formKey,
          child: Container(
          height: 500,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
            child: IntrinsicWidth(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(header,
                  textAlign: TextAlign.left,
                  style: TextStyle(  
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                  ) 
                ),
                Divider(height:15,color: Colors.white),
                Divider(height:5,color: Colors.grey[300]),
                Divider(height:15,color: Colors.white),
                Container(
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration( 
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => input.length < 1 ? 'Not a valid First Name' : null,
                    onSaved: (input) => _firstName = input,
                  ),
                ),
                Container(
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration( 
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => input.length < 1 ? 'Not a valid Last Name' : null,
                    onSaved: (input) => _lastName = input,
                  ),
                ),
                Container(
                  height: 75,
                  child: TextFormField(
                    decoration: InputDecoration( 
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent, width: 0.5)
                      ),
                    ),
                    validator: (input) => !input.contains('@') ? 'Not a valid E-mail' : null,
                    onSaved: (input) => _email = input,
                  ),
                ),
                Container(
                  height: 50, 
                  width: 150,
                  child:(
                    DropdownButton<String>(
                      hint: Text("Select a Vehicle"),
                      items: vehicles.map((String dropDownStringItem){
                        return DropdownMenuItem <String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (selectedVehicle) {
                        setState(() {
                          this._currentSelected= selectedVehicle;
                        });
                      },
                      value: this._currentSelected,
                    )
                  )
                ),
                Divider(height:35,color: Colors.white),
                Row(
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
                    // onPressed: (){
                    //   setState(() {
                    //     _fullName = _firstName + ' ' + _lastName;
                    //     DrvrDetails newDriver = new DrvrDetails('18400175', _fullName, _email);
                    //     busDrvrs.add(newDriver);
                    //   });
                    //   Navigator.pop(context);
                    // }
                  )
                ],)
              ],
            ))
          )
        )
        ),
      );
    });
  }

  void _submit()
  {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      _fullName = _firstName + ' ' + _lastName;
      setState(() {
        DrvrDetails newDriver = new DrvrDetails('18400175', _fullName, _email);
        busDrvrs.add(newDriver);
      });
      Navigator.of(context, rootNavigator: true).pop(context);
    }
  }

  List<DrvrDetails> busDrvrs = [
    new DrvrDetails('18400175', 'BUSDRV Berna Ferolin', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVJustin Ferolin', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVRaz Justinn', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVEarl Ferolin', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVConag Earl', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVRaz ', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVJustin', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVMaria', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVVen', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVJay', 'berna@email.com'),
    new DrvrDetails('18400175', 'BUSDRVJeanille', 'berna@email.com'),
  ];

  List<DrvrDetails> jeepDrvrs = [
    new DrvrDetails('18400175', 'JEEPDRVRJenel Ven', 'berna@email.com'),
    new DrvrDetails('18400175', 'Ven Jeanin', 'berna@email.com'),
    new DrvrDetails('18400175', 'Abayon Nilln', 'berna@email.com'),
    new DrvrDetails('18400175', 'Earl Ferolin', 'berna@email.com'),
    new DrvrDetails('18400175', 'JEEPDRVRConag Earl', 'berna@email.com'),
    new DrvrDetails('18400175', 'Raz ', 'berna@email.com'),
    new DrvrDetails('18400175', 'JEEPDRVRJustin', 'berna@email.com'),
    new DrvrDetails('18400175', 'Maria', 'berna@email.com'),
    new DrvrDetails('18400175', 'JEEPDRVRVen', 'berna@email.com'),
    new DrvrDetails('18400175', 'Jay', 'berna@email.com'),
    new DrvrDetails('18400175', 'Jeanille', 'berna@email.com'),
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
          title: Text("Drivers",
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
                    padding: EdgeInsets.all(30),
                    child: ListView(
                      children: busDrvrs.map((drv) => listdriver(drv)).toList(),
                    ))),
            Container(
                color: Colors.grey[250],
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: ListView(
                      children:
                          jeepDrvrs.map((drv) => listdriver(drv)).toList(),
                    ))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Add a new driver',
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              addDriver(context, "Add Driver", "Add");
            }),
      ),
    );
  }

  Container listdriver(drv) {
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
                  child: Text(drv.id,
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(drv.name, style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(drv.email, style: TextStyle(fontSize: 16)),
                ),
                Spacer(),
                Column(children: [
                  IconButton(
                    onPressed: () {},
                    tooltip: 'View Managed Drivers',
                    icon: Icon(CupertinoIcons.person, color: Colors.blue[200]),
                  )
                ]),
                Column(children: [
                  IconButton(
                    onPressed: () {},
                    tooltip: 'View Managed Buses',
                    icon: Icon(CupertinoIcons.bus, color: Colors.blue[200]),
                  )
                ]),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        addDriver(context, "View Driver Details", "Update");
                      },
                      tooltip: 'View Profile',
                      icon: Icon(CupertinoIcons.eye, color: Colors.blue[200]),
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

class DrvrDetails {
  String id;
  String name;
  String email;

  DrvrDetails(this.id, this.name, this.email);
}
