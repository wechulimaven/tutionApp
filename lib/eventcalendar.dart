import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:tutionapp/helpers/calendar.dart';

class CalendarHome extends StatefulWidget {
  @override
  _CalendarHomeState createState() => _CalendarHomeState();
}

class _CalendarHomeState extends State<CalendarHome> {
  CalendarEvents calendarClient = CalendarEvents();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(days: 1));
  TextEditingController _eventName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7f4f5),
        appBar: AppBar(
          title: Text('Add Learning Event to Calendar'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2019, 3, 5),
                          maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        setState(() {
                          this.startTime = date;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text(
                      'Event Start Time',
                      style: TextStyle(color: Colors.blue),
                    )),
                Text('$startTime'),
              ],
            ),
            Row(
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2019, 3, 5),
                          maxTime: DateTime(2200, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        setState(() {
                          this.endTime = date;
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: Text(
                      'Event End Time',
                      style: TextStyle(color: Colors.blue),
                    )),
                Text('$endTime'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _eventName,
                decoration: InputDecoration(hintText: 'Enter Event name'),
              ),
            ),
            RaisedButton(
                child: Text(
                  'Insert Event',
                ),
                color: Colors.grey,
                onPressed: () {
                  //log('add event pressed');
                  calendarClient.insert(
                    _eventName.text,
                    startTime,
                    endTime,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
