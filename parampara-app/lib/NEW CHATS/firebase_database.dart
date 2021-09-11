import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DatabaseMethods {
  List li = [];
  var logger = Logger();
  Future createDatabase(userMap) async {
    try {
      await FirebaseFirestore.instance
          .collection('newUsers')
          .add(userMap)
          .then((value) => logger.i(value));
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future getList() async {
    try {
      await FirebaseFirestore.instance
          .collection("newUsers")
          .where('id', isEqualTo: '1')
          .get()
          .then((value) {
        value.docs.map((element) {
          li.add(element['name']);
          logger.w(li);
        }).toList();
      });

      return li;
    } catch (e) {
      logger.e(e);
    }
  }
}
