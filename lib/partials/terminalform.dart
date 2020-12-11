import 'package:flutter/material.dart';
import '../common/packages.dart';
import '../controller/terminalcontroller.dart';
import '../models/terminal.dart';
import '../partials/partials.dart';

addTerminalForm(BuildContext context, String header, String opt,
    GlobalKey<FormState> _formKey, Terminal term) {
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
                          controller:
                              TextEditingController(text: term.stationnum),
                          decoration: InputDecoration(
                            labelText: 'Terminal Code(Station Number)',
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
                          onSaved: (input) => term.stationnum = input,
                        ),
                      ),
                      Container(
                        height: 75,
                        child: TextFormField(
                          controller: TextEditingController(text: term.name),
                          decoration: InputDecoration(
                            labelText: 'Terminal Name',
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
                          onSaved: (input) => term.name = input,
                        ),
                      ),
                      Container(
                        height: 75,
                        child: TextFormField(
                          controller: TextEditingController(text: term.street),
                          decoration: InputDecoration(
                            labelText: 'Street Name',
                            labelStyle: TextStyle(color: Colors.blueAccent),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 0.5)),
                          ),
                          validator: (input) => input.length < 1
                              ? "This field is required"
                              : null,
                          onSaved: (input) => term.street = input,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: DropdownSearch(
                          dialogMaxWidth: 500,
                          maxHeight: 400,
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
                          selectedItem: term.city == '' ? null : term.city,
                          validator: (String item) {
                            if (item == null)
                              return "This field is required";
                            else
                              return null;
                          },
                          // validator: (input)=>input == null ? 'This field is required' : null,
                          onSaved: (input) => term.city = input,
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
                          selectedItem:
                              term.province == '' ? null : term.province,
                          validator: (String item) {
                            if (item == null)
                              return "This field is required";
                            else
                              return null;
                          },
                          onSaved: (input) => term.province = input,
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
                          onSaved: (input) => term.country = input,
                          selectedItem:
                              term.country == '' ? null : term.country,
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
                                    submitTerminalForm(
                                        context, _formKey, term, opt);
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

void submitTerminalForm(context, _formKey, term, opt) {
  if (_formKey.currentState.validate()) {
    _formKey.currentState.save();
    if (opt == "Update") {
      //Some update code here
      TerminalController().updateTerminal(term);
    } else {
      //this adds to the list
      TerminalController().createTerminal(term);
    }
    Navigator.of(context, rootNavigator: true).pop(context);
  }
}

askConfirmation(BuildContext context, Terminal tm) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Removal Confirmation'),
            content: Text('Are you sure you want to remove ' +
                tm.name +
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
                  Navigator.of(context).pop(removeTerminal(tm));
                },
              )
            ]);
      });
}

removeTerminal(tm) {
  TerminalController().deleteTerminal(tm);
}
