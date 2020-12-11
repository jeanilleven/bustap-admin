import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../models/employee.dart';
import '../partials/partials.dart';

class EmployeeList extends StatefulWidget {
  final String employeeType;
  EmployeeList({this.employeeType}) : super();

  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final employeeSnapshot = Provider.of<List<Employee>>(context) ?? [];
    final employeeDisplay = employeeSnapshot.where((element) => element.type == widget.employeeType && element.status == false).toList();
    return ListView.builder(
      itemCount: employeeDisplay.length,
      itemBuilder: (context, index){
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
                  child: Text(employeeDisplay[index].hashCode.toString(),
                      style: TextStyle(color: Colors.blue, fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(employeeDisplay[index].fname + ' ' + employeeDisplay[index].lname, style: TextStyle(fontSize: 20)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(employeeDisplay[index].email, style: TextStyle(fontSize: 16)),
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
                        addEmployeeForm(context, "View Employee Details", "Update", _formKey, employeeDisplay[index]);
                      },
                      tooltip: 'View Profile',
                      icon: Icon(CupertinoIcons.eye, color: Colors.blue[200]),
                    )
                  ],
                ),
                Column(children: [
                  IconButton(
                    onPressed: () {
                      // askConfirmation(context, drv);
                    },
                    tooltip: 'Delete',
                    icon: Icon(CupertinoIcons.trash, color: Colors.red[200]),
                  )
                ])
              ]),
            )));
      },
    );
  }
}