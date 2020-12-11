import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../models/terminal.dart';
import '../partials/partials.dart';

class TerminalList extends StatefulWidget {
  // final String terminalStatus;
  // TerminalList({this.terminalStatus}) : super();

  @override
  _TerminalListState createState() => _TerminalListState();
}

class _TerminalListState extends State<TerminalList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final terminalSnapshot = Provider.of<List<Terminal>>(context) ?? [];
    final terminalDisplay = terminalSnapshot.where((element) => element.status == false).toList();
    return ListView.builder(
      itemCount: terminalDisplay.length,
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
                    child: Text(terminalDisplay[index].stationnum,
                        style: TextStyle(color: Colors.blue, fontSize: 20)),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(terminalDisplay[index].name, style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(terminalDisplay[index].street + ", " + terminalDisplay[index].city + ", " + terminalDisplay[index].province,
                        style: TextStyle(fontSize: 16)),
                  ),
                  Spacer(),
                  Column(children: [
                    IconButton(
                      onPressed: () {
                        addTerminalForm(context, "View Terminal Details", "Update", _formKey, terminalDisplay[index]);
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