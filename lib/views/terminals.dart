import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';

class Terminals extends StatefulWidget {
  Terminals({Key key}) : super(key: key);

  @override
  _TerminalsState createState() => _TerminalsState();
}

class _TerminalsState extends State<Terminals> {
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
                      onPressed: () {},
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
        drawer: MainDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
