import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googleandfacebook/ALL%20NAVIGATION%20ROUTES/all_page_routes.dart';
import 'package:googleandfacebook/CALENDER%20AND%20REMINDERS/CalendarFirstPage.dart';
import 'package:googleandfacebook/EVENTS%20ALL%20PAGES/my_events_single.dart';
import 'package:googleandfacebook/MATRIMONY%20ALL%20PAGES/matrimony_search_your_partner.dart';
import 'package:googleandfacebook/TEST%20PAGE/test_page.dart';
import 'package:googleandfacebook/startingpage/start.dart';
import 'CALENDER AND REMINDERS/calendartask.dart';
import 'CALENDER AND REMINDERS/remainder_form_page.dart';
import 'CALENDER AND REMINDERS/reminder_main_page.dart';
import 'EVENTS ALL PAGES/my_events_form.dart';
import 'Image Gallery/ImageGallery1.dart';
import 'NEW CHATS/chat_sign_in.dart';
import 'SplashScreeen/splashscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        primaryColor: Colors.teal.shade300,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: ChatSignUp(),
    );
  }
}

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              StartingPage(),
            ],
          ),
        ),
      ),
    );
  }
}
