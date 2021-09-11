import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'firebase_database.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var listDatas;
  final databaseMethods = DatabaseMethods();
  final logger = Logger();
  @override
  void initState() {
    gettingList();
    super.initState();
  }

  gettingList() async {
    try {
      await databaseMethods.getList().then((value) {
        //   logger.i(value.documents);
        //   logger.i(value.data);
        //   logger.i(value['data']['document']);
        //   logger.i(value.documents.data);
        logger.w(value);
        setState(() {
          listDatas = value;
          logger.e(listDatas);
        });
        // value.forEach((element) {
        //   listDatas.add(element['name']);
        // });
      });
    } catch (e) {
      logger.e(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.d(listDatas);
    return Scaffold(
      body: Container(
        height: 500,
        width: 250,
        child: listDatas == null
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : ListView.builder(
                itemCount: listDatas.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(listDatas[index]),
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
