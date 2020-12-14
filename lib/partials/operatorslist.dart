import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../models/operator.dart';
import '../partials/partials.dart';

class OperatorList extends StatefulWidget {
  final String operatorType;
  OperatorList({this.operatorType}) : super();
  
  @override
  _OperatorListState createState() => _OperatorListState();
}

class _OperatorListState extends State<OperatorList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final operatorSnapshot = Provider.of<List<Operator>>(context) ?? [];
    final operatorDisplay = operatorSnapshot.where((element) => element.type == widget.operatorType && element.status == false).toList();
    return ListView.builder(
      itemCount: operatorDisplay.length,
      itemBuilder: (context, index) {
        // return ListTile(
        //     onTap: () {}, 
        //     title: Text(operatorSnapshot[index].email)); 
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
                  flex: 1,
                  child: Text(operatorDisplay[index].hashCode.toString(),
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(operatorDisplay[index].fname + ' ' + operatorDisplay[index].lname, style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(operatorDisplay[index].email, style: TextStyle(fontSize: 16)),
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
                        addOperatorForm(
                            context, "View Operator Details", "Update", _formKey, operatorDisplay[index]);
                      },
                      tooltip: 'View Profile',
                      icon: Icon(CupertinoIcons.eye, color: Colors.blue[200]),
                    )
                  ],
                ),
                Column(children: [
                  IconButton(
                    onPressed: () {
                     askConfirmation(context, operatorDisplay[index]);
                    },
                    tooltip: 'Delete',
                    icon: Icon(CupertinoIcons.trash, color: Colors.red[200]),
                  )
                ])
              ]),
            )));
      },
      // children: busOps.map((op) => listoperator(op)).toList(),
    );
  }
}
