import 'package:flutter/material.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarClient {
  static var _scopes = [CalendarApi.calendarScope];
  static var logger = Logger();

  insert(title, startTime, endTime, description) {
    var _clientID = new ClientId(
        "652051068384-q5cemmgc50rbd4tb5lgqp242s2gaf2t1.apps.googleusercontent.com",
        "");

    clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client) {
      var calendar = CalendarApi(client);
      calendar.calendarList
          .list()
          .then((value) => logger.w("VAL________$value"));

      String calendarId = "primary";
      Event event = Event(); // Create object of event

      event.summary = title;
      event.description = description;
      EventDateTime start = new EventDateTime();
      start.dateTime = startTime;
      logger.w(startTime);
      start.timeZone = "GMT+05:00";
      event.start = start;

      EventDateTime end = new EventDateTime();

      end.timeZone = "GMT+05:00";
      end.dateTime = endTime;
      logger.w(endTime);
      // dev.log(endTime);
      event.end = end;
      try {
        calendar.events.insert(event, calendarId).then((value) {
          logger.w("ADDEDDD_________________${value.status}");
          if (value.status == "confirmed") {
            logger.e('Event added in google calendar');
          } else {
            logger.e("Unable to add event in google calendar");
          }
        });
      } catch (e) {
        logger.e('Error creating event $e');
      }
    });
  }

  void prompt(String url) async {
    logger.w("Please go to the following URL and grant access:");
    logger.w("  => $url");
    logger.e("granting access i think so");

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
