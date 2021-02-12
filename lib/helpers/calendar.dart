import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'dart:html';
// import 'dart:io';

import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarEvents {
  static const _scopes = const [CalendarApi.CalendarScope];
  insert(title, startTime, endTime) {
    var _credentials;
   
      if (Platform.isAndroid) {
        _credentials = new ClientId('This is the IOS platform',
            "1054388772283-40ciled37e3eani7pimpscvtj8agvgi8.apps.googleusercontent.com");
      } else if (Platform.isIOS) {
        _credentials = new ClientId('This is the IOS platform',
            "1054388772283-ef0scu33nbnjmhgmbl6vgiunin4j6dg9.apps.googleusercontent.com");
      }
      var _clientID = new ClientId("YOUR_CLIENT_ID", "1054388772283-40ciled37e3eani7pimpscvtj8agvgi8.apps.googleusercontent.com");
    

    clientViaUserConsent(_clientID, _scopes, prompt).then;
    ((AuthClient client) {
      var calendar = CalendarApi(client);
      calendar.calendarList.list().then((value) => print('VAL_______$value'));
      String calendarId = 'primary';
      Event event = Event();
      event.summary = title;

      EventDateTime start = new EventDateTime();
      start.dateTime = startTime;
      start.timeZone = 'GMT+05:00';
      event.start = start;

      EventDateTime end = new EventDateTime();
      end.dateTime = startTime;
      end.timeZone = 'GMT+05:00';
      event.end = end;
      try {
        calendar.events.insert(event, calendarId).then((value) {
          if (value.status == 'confirmed') {
            log('Event added in google calendar');
          } else {
            log('unable to add event in google calendar');
          }
        });
      } catch (e) {
        log('Error creating event $e');
      }
    });
  }

  void prompt(String url) async {
    print("Please go to the following URL and grant access:");
    print("  => $url");
    print("");

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// class AddCalendarEvents extends StatefulWidget {

//   @override
//   _AddCalendarEventsState createState() => _AddCalendarEventsState();
// }

// class _AddCalendarEventsState extends State<AddCalendarEvents> {
//   static const _scopes = const [CalendarApi.CalendarScope];

//   var _credentials;
//   // Platform(isAndroid)
//   void simple(){
//   if (Platform.isAndroid) {
//         _credentials = new ClientId(
//           'This is the android platform',
//             "1054388772283-40ciled37e3eani7pimpscvtj8agvgi8.apps.googleusercontent.com");
//       } else

//       if (Platform.isIOS) {
//         _credentials = new ClientId(
//           'This is the IOS platform',
//           "1054388772283-ef0scu33nbnjmhgmbl6vgiunin4j6dg9.apps.googleusercontent.com");
//       }

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }

//   // EventDateTime start = new EventDateTime(); //Setting start time
//   //     start.dateTime = startTime;
//   //     start.timeZone = "GMT+05:00";
//   //     event.start = start;

//   //     EventDateTime end = new EventDateTime(); //setting end time
//   //     end.timeZone = "GMT+05:00";
//   //     end.dateTime = endTime;
//   //     event.end = end;

// // insertEvent(event){
// // try {
// //         clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client){
// //         var calendar = CalendarApi(client);
// //         String calendarId = "primary";
// //         calendar.events.insert(event,calendarId).then((value) {
// //           print("ADDEDDD_________________${value.status}");
// //           if (value.status == "confirmed") {
// //             log('Event added in google calendar');
// //           } else {
//             log("Unable to add event in google calendar");
//           }
//         });
//         });
//       } catch (e) {
//         log('Error creating event $e');
//       }
// }

//   void prompt(String url) async {

//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
