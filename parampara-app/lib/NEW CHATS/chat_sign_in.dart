import 'package:flutter/material.dart';
import 'package:googleandfacebook/NEW%20CHATS/firebase_all_method_class.dart';
import 'package:logger/logger.dart';

import 'firebase_database.dart';
import 'list_page.dart';

class ChatSignUp extends StatefulWidget {
  @override
  _ChatSignUpState createState() => _ChatSignUpState();
}

class _ChatSignUpState extends State<ChatSignUp> {
  AllFirebaseService service = AllFirebaseService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var emails, passwords;
  var logger = Logger();
  final databaseMethods = DatabaseMethods();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: signInto,
              child: Text('Sign up'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: signInMethod,
              child: Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }

  signInto() async {
    Map<String, dynamic> userMap = {
      'name': emailController.text,
      'email': emailController.text
    };
    setState(() {
      emails = emailController.text;
      passwords = passwordController.text;

      logger.w(emails);
      logger.w(passwords);
    });

    await service.createUser(emails, passwords).then((value) {
      // logger.i(value.userId);
    });
    await databaseMethods
        .createDatabase(userMap)
        .then((value) => logger.w(value));

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListPage()));
  }

  signInMethod() async {
    Map<String, dynamic> userMap = {
      'name': emailController.text,
      'email': emailController.text
    };
    setState(() {
      emails = emailController.text;
      passwords = passwordController.text;

      logger.w(emails);
      logger.w(passwords);
    });

    await service.trySignIn(emails, passwords).then((value) {
      logger.i(value.userId);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListPage()));
    });
    // await databaseMethods
    //     .createDatabase(userMap)
    //     .then((value) => logger.w(value));
  }
}
