import 'package:flutter/material.dart';
import '../partials/partials.dart';
import '../common/packages.dart';
import '../models/terminal.dart';
import '../controller/terminalcontroller.dart';

class Terminals extends StatefulWidget {
  Terminals({Key key}) : super(key: key);

  @override
  _TerminalsState createState() => _TerminalsState();
}

class _TerminalsState extends State<Terminals> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      // terminaldetails.remove(object);
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
          onPressed: () {
            Terminal term = new Terminal(city: '', country: '', name: '', province: '', stationnum: '', street: '');
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
            )
          ),
        )
    );
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
