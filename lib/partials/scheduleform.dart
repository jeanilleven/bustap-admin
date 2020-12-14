import 'package:bustap/controller/terminalcontroller.dart';
import 'package:flutter/material.dart';
import '../common/packages.dart';
import 'package:date_time_picker/date_time_picker.dart';
import '../controller/schedulecontroller.dart';
import '../models/schedules.dart';
import '../models/terminal.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:bustap/partials/loadingPage.dart';

  addScheduleForm(BuildContext context, String header, String opt, GlobalKey<FormState> _formKey, Schedule sched) {
    return showDialog(
        context: context,
        builder: (context) {
          return StreamBuilder<List<Terminal>>(
            stream: TerminalController().retrieveAllTerminals,
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Loading();
              }
              List<String> terminalCodes = [];
              snapshot.data.forEach((element) {
                terminalCodes.add(element.stationnum);
              });
              return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      height: 370,
                      width: 550,
                      child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 20.0),
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
                            child: DateTimePicker(
                              type: DateTimePickerType.dateTimeSeparate,
                              firstDate: sched.time,
                              lastDate: DateTime(2100),
                              dateLabelText: 'Bus Schedule',
                              initialValue: sched.time.toString(),
                              onChanged: (val) => print(val),
                              validator: (val) {
                                if(val == ''){
                                  return "This field is required";
                                }else{
                                  return null;
                                }
                              },
                              onSaved: (val) => sched.time = DateTime.parse(val),
                            )
                          ),
                            Divider(height: 25, color: Colors.white),
                            Container(
                        padding: EdgeInsets.all(5),
                        child: DropdownSearch(
                          dialogMaxWidth: 500,
                          maxHeight: 325,
                          items: terminalCodes,
                          label: "Select a Terminal",
                          hint: "Terminal Code",
                          showClearButton: true,
                          showSearchBox: true,
                          onChanged: (value) => sched.terminalcode = value, 
                          selectedItem: sched.terminalcode,
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
                                        if(_formKey.currentState.validate()){
                                          submitScheduleForm(context, _formKey, sched, opt, snapshot.data);
                                        }
                                    })
                                ],
                              ),
                            ),
                          ]))),
                    ),
                  ));
            }
          );
        });
  }

  void submitScheduleForm(context, _formKey, sched, opt, List<Terminal>terminals) {
    if (_formKey.currentState.validate()) {
      Terminal temp = terminals.firstWhere((element)=>element.stationnum == sched.terminalcode);
      _formKey.currentState.save();
      if (opt == "Update") {
        //Some code to update here
        ScheduleController().updateSchedule(sched, temp);
      } else {
        //this adds to the list
        ScheduleController().createSchedule(sched, temp);
      }
      Navigator.of(context, rootNavigator: true).pop(context);
    }
  }

  askScheduleConfirmation(BuildContext context, Schedule sc) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Removal Confirmation'),
            content: Text('Are you sure you want to remove ' +
                sc.uid +
                ' from the list of schedules?'),
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
                  Navigator.of(context).pop(removeSchedule(sc));
                },
              )
            ]);
      });
}
removeSchedule(sc) {
  ScheduleController().deleteSchedule(sc);
}