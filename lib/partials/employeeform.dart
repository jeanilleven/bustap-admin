import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/employeecontroller.dart';
import '../models/employee.dart';
import '../partials/partials.dart';

addEmployeeForm(BuildContext context, String header, String opt,
    GlobalKey<FormState> _formKey, Employee em) {
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
                    padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
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
                          controller: TextEditingController(text: em.fname),
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 0.5)),
                          ),
                          validator: (input) => input.length < 1
                              ? 'This field is required'
                              : null,
                          onSaved: (input) => em.fname = input,
                        ),
                      ),
                      Container(
                        height: 75,
                        child: TextFormField(
                          controller: TextEditingController(text: em.lname),
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 0.5)),
                          ),
                          validator: (input) => input.length < 1
                              ? 'This field is required'
                              : null,
                          onSaved: (input) => em.lname = input,
                        ),
                      ),
                      Container(
                        height: 75,
                        child: TextFormField(
                          controller: TextEditingController(text: em.email),
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 0.5)),
                          ),
                          validator: (input) => EmailValidator.validate(input)
                              ? null
                              : "Invalid E-mail Address",
                          onSaved: (input) => em.email = input,
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 250,
                        child: TextFormField(
                            controller:
                                TextEditingController(text: em.licensenum),
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
                            validator: (input) => input.length != 11
                                ? 'Invalid License Number'
                                : null,
                            onSaved: (input) => em.licensenum = input),
                      ),
                      Container(
                        height: 75,
                        child: TextFormField(
                          controller: TextEditingController(text: em.phonenum),
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 0.5)),
                          ),
                          validator: (input) => input.length != 11
                              ? 'Invalid Phone Number'
                              : null,
                          onSaved: (input) => em.phonenum = input,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: DropdownSearch(
                          selectedItem: em.type,
                          dialogMaxWidth: 500,
                          maxHeight: 150,
                          items: ["Bus Driver", "Jeepney Driver", "Conductor"],
                          label: "Select Employment type",
                          // onChanged: print,
                          hint: "Vehicle",
                          showClearButton: true,
                          validator: (String item) {
                            if (item == null)
                              return "Invalid Vehicle";
                            else
                              return null;
                          },
                          onSaved: (input) => em.type = input,
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
                                  opt,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    submitEmployeeForm(
                                        context, _formKey, em, opt);
                                  }
                                })
                          ],
                        ),
                      ),
                    ]))),
              ),
            ));
      });
}

void submitEmployeeForm(context, _formKey, em, opt) {
  if (_formKey.currentState.validate()) {
    _formKey.currentState.save();
    if (opt == "Update") {
      //Some code to update here
      EmployeeController().updateEmployee(em);
    } else {
      //this adds to the list
      EmployeeController().createEmployee(em);
    }
    Navigator.of(context, rootNavigator: true).pop(context);
  }
}

askEmConfirmation(BuildContext context, Employee em) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Removal Confirmation'),
            content: Text('Are you sure you want to remove ' +
                em.fname +
                ' ' +
                em.lname +
                ' from the list of operators?'),
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
                  Navigator.of(context).pop(removeEmployee(em));
                },
              )
            ]);
      });
}

removeEmployee(em) {
  EmployeeController().deleteEmployee(em);
}

addManagedVehicle(
    BuildContext context, Employee em, GlobalKey<FormState> _formKey) {
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
                    height: 350,
                    width: 550,
                    child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
                        child: IntrinsicWidth(
                            child: ListView(children: [
                          Text(
                              "Assigned Vehicle of " +
                                  em.fname +
                                  " " +
                                  em.lname,
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
                              child: DropdownSearch(
                                dialogMaxWidth: 500,
                                maxHeight: 150,
                                items: [
                                  "Bus Driver",
                                  "Jeepney Driver",
                                  "Conductor"
                                ],
                                label: "Select Vehicle",
                                // onChanged: print,
                                hint: "Vehicle",
                                showClearButton: true,
                                validator: (String item) {
                                  if (item == null)
                                    return "Invalid Vehicle";
                                  else
                                    return null;
                                },
                                onSaved: (input) => em.type = input,
                              )),
                          Container(
                              height: 75,
                              child: DropdownSearch(
                                dialogMaxWidth: 500,
                                maxHeight: 150,
                                items: [
                                  "Bus Driver",
                                  "Jeepney Driver",
                                  "Conductor"
                                ],
                                label: "Select Conductor",
                                // onChanged: print,
                                hint: "Vehicle",
                                showClearButton: true,
                                validator: (String item) {
                                  if (item == null)
                                    return "Invalid Vehicle";
                                  else
                                    return null;
                                },
                                onSaved: (input) => em.type = input,
                              )),
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
                                      "Assign",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        submitEmployeeForm(
                                            context, _formKey, em, "Assign");
                                      }
                                    })
                              ],
                            ),
                          ),
                        ]))))));
      });
}
