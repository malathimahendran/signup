import 'package:flutter/material.dart';

import 'CalendarAll.dart';
import 'CalendarEvents.dart';
import 'CalendarTask1.dart';

class CalendarTask extends StatefulWidget {
  @override
  _CalendarTaskState createState() => _CalendarTaskState();
}

class _CalendarTaskState extends State<CalendarTask>
    with SingleTickerProviderStateMixin {
  var tabs1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs1 = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabs1.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var statusbarheight = MediaQuery.of(context).padding.top;
    // var bottom = kBottomNavigationBarHeight;
    // var safeArea = MediaQuery.of(context).padding.top;
    // var padding = MediaQuery.of(context).padding;
    // var today = DateTime.now();
    var appbar = AppBar().preferredSize.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appbar),
        child: AppBar(
          backgroundColor: Colors.cyan[900],
          bottom: TabBar(
            controller: tabs1,
            tabs: [
              Tab(
                text: "Tasks",
              ),
              Tab(text: "All"),
              Tab(
                text: "Events",
              )
            ],
          ),
        ),
      ),
      body: Container(
        height: height - (appbar + statusbarheight),
        width: width,
        child: TabBarView(
          controller: tabs1,
          children: [CalendarTask1(), CalendarAll(), CalendarEvents()],
        ),
      ),
    );
  }
}
