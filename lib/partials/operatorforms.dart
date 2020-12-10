import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/operatorcontroller.dart';
import '../partials/partials.dart';

addOperatorForm(BuildContext context, String header, String opt,
    GlobalKey<FormState> _formKey) {
  String fname, lname, phonenum, type, email;
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Form(
                key: _formKey,
                child: Container(
                    height: 540,
                    width: 550,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
                      child: IntrinsicWidth(
                          child: ListView(children: [
                        Text(header,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Divider(height: 15, color: Colors.white),
                        Divider(height: 5, color: Colors.grey[300]),
                        Divider(height: 5, color: Colors.white),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller: TextEditingController(text: fname),
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
                            onSaved: (input) => fname = input,
                          ),
                        ),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller: TextEditingController(text: lname),
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
                            onSaved: (input) => lname = input,
                          ),
                        ),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller: TextEditingController(text: email),
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
                            onSaved: (input) => email = input,
                          ),
                        ),
                        Container(
                          height: 75,
                          child: TextFormField(
                            controller:
                                TextEditingController(text:phonenum),
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
                            onSaved: (input) => phonenum = input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: DropdownSearch(
                            searchBoxController:
                                TextEditingController(text: type),
                            dialogMaxWidth: 500,
                            maxHeight: 100,
                            items: ["Bus", "Jeepney"],
                            label: "Select a Vehicle",
                            hint: "Vehicle",
                            showClearButton: true,
                            validator: (String item) {
                              if (item == null)
                                return "Invalid Vehicle";
                              else
                                return null;
                            },
                            onSaved: (input) => type = input,
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
                                    Navigator.of(context).pop(
                                      print(fname)// You can call OperatorController().createOperator() here instead, just for testing purposes ang print.
                                    );
                                  })
                            ],
                          ),
                        ),
                      ])),
                    ))));
      });
}
