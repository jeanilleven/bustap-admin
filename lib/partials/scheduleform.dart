import 'package:flutter/material.dart';
import '../common/packages.dart';
import 'package:date_time_picker/date_time_picker.dart';
import '../controller/schedulecontroller.dart';
import '../models/schedules.dart';

  addScheduleForm(BuildContext context, String header, String opt, GlobalKey<FormState> _formKey, Schedule sched) {
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
                        height: 75,
                        child: TextFormField(
                          controller:
                              TextEditingController(text: sched.terminalcode),
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
                          onSaved: (input) => sched.terminalcode = input,
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
                                      submitScheduleForm(context, _formKey, sched, opt);
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

  void submitScheduleForm(context, _formKey, sched, opt) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (opt == "Update") {
        //Some code to update here
        ScheduleController().updateSchedule(sched);
      } else {
        //this adds to the list
        ScheduleController().createSchedule(sched);
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