import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../partials/trmnlpartials.dart';
import '../common/packages.dart';
import '../models/terminal.dart';
import '../controller/terminalcontroller.dart';

class Terminals extends StatefulWidget {
  Terminals(this.userDoc, this.userCred, this.auth, {Key key})
      : super(key: key);
  final Auth auth;
  final DocumentSnapshot userDoc;
  final User userCred;
  @override
  _TerminalsState createState() => _TerminalsState();
}

class _TerminalsState extends State<Terminals> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.teal),
            title: Text('Terminals', style: TextStyle(color: Colors.blue))),
        drawer: MainDrawer(widget.userDoc, widget.userCred, widget.auth),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Terminal term = new Terminal(
                city: '',
                country: '',
                name: '',
                province: '',
                stationnum: '',
                street: '');
            addTerminalForm(context, "Add Terminal", "Add", _formKey, term);
          },
          child: Icon(CupertinoIcons.add),
          tooltip: 'Add a new terminal',
        ),
        body: StreamProvider<List<Terminal>>.value(
          value: TerminalController().retrieveAllTerminals,
          child: Container(
              child: Padding(
            padding: EdgeInsets.all(30),
            child: TerminalList(),
          )),
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
