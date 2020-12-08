import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
// import '../views/views.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:email_validator/email_validator.dart';

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
  String _driverVehicle = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _firstName,
      _lastName,
      _email,
      _fullName,
      _dLicense,
      _phoneNum,
      _opt,
      fName,
      lName;
  addDriver(BuildContext context, String header, String option, DrvrDetails d) {
    // TextEditingController customerController = TextEditingController();
    _opt = option;
    if (d.name != '') {
      fName = d.name.split(" ")[0];
      if (d.name.split(" ").length > 1) {
        lName = d.name.split(" ")[1];
      } else {
        lName = '';
      }
    } else {
      fName = lName = '';
    }
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Form(
                key: _formKey,
                child: Container(
                  height: 550,
                  width: 550,
                  child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
                      child: IntrinsicWidth(
                          child: ListView(children: [
                        Text(header,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        Divider(height: 15, color: Colors.white),
                        Divider(height: 5, color: Colors.grey[300]),
                        Divider(height: 5, color: Colors.white),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller: TextEditingController(text: fName),
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (input) => input.length < 1
                                ? 'This field is required'
                                : null,
                            onSaved: (input) => _firstName = input,
                          ),
                        ),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller: TextEditingController(text: lName),
                            decoration: InputDecoration(
                              labelText: 'Last Name',
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (input) => input.length < 1
                                ? 'This field is required'
                                : null,
                            onSaved: (input) => _lastName = input,
                          ),
                        ),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller: TextEditingController(text: d.email),
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (input) => EmailValidator.validate(input)
                                ? null
                                : "Invalid E-mail Address",
                            onSaved: (input) => _email = input,
                          ),
                        ),
                        Container(
                          height: 75,
                          width: 250,
                          child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'License Number',
                                labelStyle: TextStyle(color: Colors.blueAccent),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueAccent, width: 0.5)),
                              ),
                              onSaved: (input) => _dLicense = input),
                        ),
                        Container(
                          height: 75,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (input) => input.length != 11
                                ? 'Invalid Phone Number'
                                : null,
                            onSaved: (input) => _phoneNum = input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: DropdownSearch(
                            dialogMaxWidth: 500,
                            maxHeight: 100,
                            items: ["Bus", "Jeepney"],
                            label: "Select a Vehicle",
                            // onChanged: print,
                            hint: "Vehicle",
                            showClearButton: true,
                            validator: (String item) {
                              if (item == null)
                                return "Invalid Vehicle";
                              else
                                return null;
                            },
                            onSaved: (input) => _driverVehicle = input,
                          ),
                        ),
                        Divider(height: 25, color: Colors.white),
                        Container(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
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
                            ],
                          ),
                        ),
                      ]))),
                ),
              ));
        });
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _fullName = _firstName + ' ' + _lastName;
      setState(() {
        if (_opt == "Update") {
          //Some code to update here
        } else {
          if (_driverVehicle == "Bus") {
            busDrvrs.add(new DrvrDetails('18400175', _fullName, _email, 1));
          } else {
            jeepDrvrs.add(new DrvrDetails('18400175', _fullName, _email, 2));
          }
        }
      });
      Navigator.of(context, rootNavigator: true).pop(context);
    }
  }

  List<DrvrDetails> busDrvrs = [
    new DrvrDetails('18400175', 'BUSDRV Berna Ferolin', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVJustin Ferolin', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVRaz Justinn', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVEarl Ferolin', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVConag Earl', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVRaz ', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVJustin', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVMaria', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVVen', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVJay', 'berna@email.com', 1),
    new DrvrDetails('18400175', 'BUSDRVJeanille', 'berna@email.com', 1),
  ];

  List<DrvrDetails> jeepDrvrs = [
    new DrvrDetails('18400175', 'JEEPDRVRJenel Ven', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'Ven Jeanin', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'Abayon Nilln', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'Earl Ferolin', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'JEEPDRVRConag Earl', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'Raz ', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'JEEPDRVRJustin', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'Maria', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'JEEPDRVRVen', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'Jay', 'berna@email.com', 2),
    new DrvrDetails('18400175', 'Jeanille', 'berna@email.com', 2),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.teal),
          title: Text("Employees",
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
              Tab(
                  text: 'Conductors',
                  icon: Icon(Icons.assistant, color: Colors.blue)),
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
              DrvrDetails drv = new DrvrDetails('', '', '', 0);
              addDriver(context, "Add Driver", "Add", drv);
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
                    tooltip: 'View Managed Vehicles',
                    icon: Icon(CupertinoIcons.bus, color: Colors.blue[200]),
                  )
                ]),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        addDriver(
                            context, "View Driver Details", "Update", drv);
                      },
                      tooltip: 'View Profile',
                      icon: Icon(CupertinoIcons.eye, color: Colors.blue[200]),
                    )
                  ],
                ),
                Column(children: [
                  IconButton(
                    onPressed: () {
                      askConfirmation(context, drv);
                    },
                    tooltip: 'Delete',
                    icon: Icon(CupertinoIcons.trash, color: Colors.red[200]),
                  )
                ])
              ]),
            )));
  }

  askConfirmation(BuildContext context, object) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Removal Confirmation'),
              content: Text('Are you sure you want to remove ' +
                  object.id +
                  ' - ' +
                  object.name +
                  ' from the list of drivers?'),
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
                    Navigator.of(context).pop(removeDriver(object));
                  },
                )
              ]);
        });
  }

  removeDriver(object) {
    setState(() {
      if (object.type == 1) {
        busDrvrs.remove(object);
      } else {
        jeepDrvrs.remove(object);
      }
    });
  }
}

class DrvrDetails {
  String id;
  String name;
  String email;
  int type; //1 is busdriver, 2 is jeepdriver
  DrvrDetails(this.id, this.name, this.email, this.type);
}
