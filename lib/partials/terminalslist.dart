import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../models/terminal.dart';
import '../partials/partials.dart';

class TerminalList extends StatefulWidget {
  // TerminalList(Key key) : super(key:key);

  @override
  _TerminalListState createState() => _TerminalListState();
}

class _TerminalListState extends State<TerminalList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final terminalSnapshot = Provider.of<List<Terminal>>(context) ?? [];
    return ListView.builder(
      itemCount: terminalSnapshot.length,
      itemBuilder: (context, index){
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
                    child: Text(terminalSnapshot[index].stationnum,
                        style: TextStyle(color: Colors.blue, fontSize: 20)),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(terminalSnapshot[index].name, style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(terminalSnapshot[index].street + ", " + terminalSnapshot[index].city + ", " + terminalSnapshot[index].province,
                        style: TextStyle(fontSize: 16)),
                  ),
                  Spacer(),
                  Column(children: [
                    IconButton(
                      onPressed: () {
                        addTerminalForm(context, "View Terminal Details", "Update", _formKey, terminalSnapshot[index]);
                        // addTerminal(
                        //     context, "View Terminal Details", "Update", td);
                      },
                      tooltip: 'View Terminal Details',
                      icon: Icon(CupertinoIcons.eye, color: Colors.blue[200]),
                    )
                  ]),
                  Column(children: [
                    IconButton(
                      onPressed: () {
                        // askConfirmation(context, td);
                      },
                      tooltip: 'Delete',
                      icon: Icon(CupertinoIcons.trash, color: Colors.red[200]),
                    )
                  ]),
                ]))));
      },   
    );
  }
}