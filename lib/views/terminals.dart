import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
import '../controller/terminalcontroller.dart';

class Terminals extends StatefulWidget {
  Terminals(this.userDoc, this.userCred, {Key key}) : super(key: key);


  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  _TerminalsState createState() => _TerminalsState();
}

class _TerminalsState extends State<Terminals> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _stationNo,
      _adStreet,
      _adCity,
      _adProvince,
      _terminalName,
      street,
      province,
      city,
      _country,
      _opt;
  addTerminal(
      BuildContext context, String header, String option, TerminalDetails t) {
    _opt = option;
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
                  height: 600,
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
                            controller: TextEditingController(text: t.id),
                            decoration: InputDecoration(
                              labelText: 'Terminal Code(Station Number)',
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
                            onSaved: (input) => _stationNo = input,
                          ),
                        ),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller: TextEditingController(text: t.name),
                            decoration: InputDecoration(
                              labelText: 'Terminal Name',
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
                            onSaved: (input) => _terminalName = input,
                          ),
                        ),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller: TextEditingController(text: t.street),
                            decoration: InputDecoration(
                              labelText: 'Street Name',
                              labelStyle: TextStyle(color: Colors.blueAccent),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 0.5)),
                            ),
                            validator: (input) => input.length < 1
                                ? "This field is required"
                                : null,
                            onSaved: (input) => _adStreet = input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: DropdownSearch(
                            dialogMaxWidth: 500,
                            maxHeight: 600,
                            items: [
                              "Alcantara",
                              "Alcoy",
                              "Alegria",
                              "Aloguinsan",
                              "Argao",
                              "Asturias",
                              "Badian",
                              "Balamban",
                              "Bantayan",
                              "Barile",
                              "Bogo",
                              "Boljoon",
                              "Borbon",
                              "Carcar",
                              "Carmen",
                              "Catmon",
                              "Cebu City",
                              "Compostela",
                              "Consolacion",
                              "Cordova",
                              "Daang-Bantayan",
                              "Dalaguete",
                              "Danao City",
                              "Dumanjug",
                              "Ginatilan",
                              "Lapu-Lapu City",
                              "Liloan",
                              "Madridejos",
                              "Malabuyoc",
                              "Mandaue City",
                              "Medellin",
                              "Minglanilla",
                              "Moalboal",
                              "Naga",
                              "Oslob",
                              "Pilar",
                              "Pinamungahan",
                              "Poro",
                              "Ronda",
                              "Samboan",
                              "San Fernando",
                              "San Francisco",
                              "San Remegio",
                              "Santa Fe",
                              "Santander",
                              "Sibonga",
                              "Sogod",
                              "Tabogon",
                              "Tabuelan",
                              "Talisay",
                              "Toledo City",
                              "Tuburan",
                              "Tudela"
                            ],
                            label: "Select a City/Municipality",
                            hint: "City/Municipality",
                            showClearButton: true,
                            showSearchBox: true,
                            selectedItem: t.city,
                            validator: (String item) {
                              if (item == null)
                                return "This field is required";
                              else
                                return null;
                            },
                            onSaved: (input) => _adCity = input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: DropdownSearch(
                            dialogMaxWidth: 500,
                            maxHeight: 200,
                            items: ["Cebu"],
                            label: "Select a Province",
                            hint: "Province",
                            showClearButton: true,
                            showSearchBox: true,
                            selectedItem: t.province,
                            validator: (String item) {
                              if (item == null)
                                return "This field is required";
                              else
                                return null;
                            },
                            onSaved: (input) => _adProvince = input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: DropdownSearch(
                            dialogMaxWidth: 500,
                            maxHeight: 200,
                            items: ["Philippines"],
                            label: "Select a Country",
                            hint: "Country",
                            showClearButton: true,
                            showSearchBox: true,
                            validator: (String item) {
                              if (item == null)
                                return "This field is required";
                              else
                                return null;
                            },
                            onSaved: (input) => _country = input,
                            selectedItem: t.country,
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
      setState(() {
        if (_opt == "Update") {
          //Some update code here
        } else {
          //this adds to the list
          // createTerminal(_stationNo, _terminalName, _adCity, _adStreet,
              // _adProvince, _country);
        }
      });
      Navigator.of(context, rootNavigator: true).pop(context);
    }
  }

  List<TerminalDetails> terminaldetails = [
    new TerminalDetails(
        'TRMNL001', 'Termina 01', 'Philippines', 'Cebu', 'Osmena', 'Cebu City'),
    new TerminalDetails(
        'TRMNL002', 'Termina 02', 'Philippines', 'Cebu', 'Pardo', 'Cebu City'),
    new TerminalDetails('TRMNL003', 'Termina 03', 'Philippines', 'Cebu',
        'Osmena', 'Lapu-lapu City'),
    new TerminalDetails(
        'TRMNL004', 'Termina 04', 'Philippines', 'Cebu', 'Osmena', 'Cebu City'),
    new TerminalDetails('TRMNL005', 'Termina 05', 'Philippines', 'Cebu',
        'Osmena', 'Mandaue City'),
    new TerminalDetails(
        'TRMNL006', 'Termina 06', 'Philippines', 'Cebu', 'Osmena', 'Cebu City'),
    new TerminalDetails('TRMNL007', 'Termina 07', 'Philippines', 'Cebu',
        'Osmena', 'Liloan City'),
    new TerminalDetails('TRMNL008', 'Termina 08', 'Philippines', 'Cebu',
        'Osmena', 'Consolacion City'),
    new TerminalDetails(
        'TRMNL009', 'Termina 09', 'Philippines', 'Cebu', 'Osmena', 'Cebu City'),
  ];

  Container listTerminal(td) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Material(
            elevation: 14,
            shadowColor: Colors.blueGrey,
            borderRadius: BorderRadius.circular(24),
            child: Padding(
                padding: EdgeInsets.all(20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Expanded(
                    flex: 3,
                    child: Text(td.id,
                        style: TextStyle(color: Colors.blue, fontSize: 20)),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(td.name, style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(td.street + ", " + td.city + ", " + td.province,
                        style: TextStyle(fontSize: 16)),
                  ),
                  Spacer(),
                  Column(children: [
                    IconButton(
                      onPressed: () {
                        addTerminal(
                            context, "View Terminal Details", "Update", td);
                      },
                      tooltip: 'View Terminal Details',
                      icon: Icon(CupertinoIcons.eye, color: Colors.blue[200]),
                    )
                  ]),
                  Column(children: [
                    IconButton(
                      onPressed: () {
                        askConfirmation(context, td);
                      },
                      tooltip: 'Delete',
                      icon: Icon(CupertinoIcons.trash, color: Colors.red[200]),
                    )
                  ]),
                ]))));
  }

  askConfirmation(BuildContext context, object) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Removal Confirmation'),
              content: Text('Are you sure you want to remove ' +
                  object.id +
                  ' from the list of terminals?'),
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
                    Navigator.of(context).pop(removeTerminal(object));
                  },
                )
              ]);
        });
  }

  removeTerminal(object) {
    setState(() {
      terminaldetails.remove(object);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.teal),
            title: Text('Terminals', style: TextStyle(color: Colors.blue))),
        drawer: MainDrawer(widget.userDoc, widget.userCred),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            TerminalDetails td = new TerminalDetails('', '', '', '', '', '');
            addTerminal(context, "Add Terminal", "Add", td);
          },
          child: Icon(CupertinoIcons.add),
          tooltip: 'Add a new terminal',
        ),
        body: Container(
          child: Padding(
              padding: EdgeInsets.all(30),
              child: ListView(
                  children:
                      terminaldetails.map((td) => listTerminal(td)).toList())),
        ));
  }
}

class TerminalDetails {
  String id;
  String country;
  String province;
  String street;
  String city;
  String name;

  TerminalDetails(
      this.id, this.name, this.country, this.province, this.street, this.city);
}
