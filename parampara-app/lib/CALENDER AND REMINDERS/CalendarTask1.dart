import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

// import 'package:hexcolor/hexcolor.dart';
class CalendarTask1 extends StatefulWidget {
  @override
  _CalendarTask1State createState() => _CalendarTask1State();
}

class _CalendarTask1State extends State<CalendarTask1> {
  var logger = Logger();
  bool isChecked = false;
  var onChanged;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay;
  var fNowDay = DateTime.now();
  var rangeEnd;
  var rangeStart;
  var rangeSelectionMode = RangeSelectionMode.toggledOn;
  var first;
  var end;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var appbar = AppBar().preferredSize.height;
    var width = MediaQuery.of(context).size.width;
    var statusbarheight = MediaQuery.of(context).padding.top;
    var today = DateTime.now();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        // color: Colors.orange,
        height: height - (appbar + statusbarheight),
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: (height - (appbar + statusbarheight)) * 0.20,
                width: width,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Image.asset('assets/Calender.jpeg'),
              ),
              Container(
                height: (height - (appbar + statusbarheight)) * 0.80,
                width: width,
                child: Stack(
                  children: [
                    Container(
                      // padding: EdgeInsets.zero,
                      height: (height - (appbar + statusbarheight)) * 0.45,
                      width: width,
                      // color: Colors.teal,
                      child: TableCalendar(
                        rowHeight: 40,
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(fontSize: 12),
                          weekendStyle: TextStyle(fontSize: 12),
                        ),
                        focusedDay: fNowDay,
                        firstDay: DateTime(DateTime.now().year - 1),
                        lastDay: DateTime(2022),
                        calendarFormat: format,
                        onFormatChanged: (formatChanged) {
                          setState(() {
                            format = formatChanged;
                          });
                        },
                        startingDayOfWeek: StartingDayOfWeek.sunday,
                        daysOfWeekVisible: true,
                        onDaySelected: (selectDay, focusDay) {
                          setState(() {
                            selectedDay = selectDay;
                            fNowDay = focusDay;
                            rangeStart = null;
                            rangeEnd = null;
                            rangeSelectionMode = RangeSelectionMode.toggledOff;
                          });
                        },
                        enabledDayPredicate: (val) {
                          if ((val.day < DateTime.now().day) &&
                              (val.month == DateTime.now().month)) {
                            return false;
                          } else if (val.month < DateTime.now().month) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                        // selectedDayPredicate: (date) {
                        //   return isSameDay(selectedDay, date);
                        // },
                        calendarStyle: CalendarStyle(
                          cellMargin: EdgeInsets.zero,
                          outsideDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          markersAutoAligned: true,
                          isTodayHighlighted: true,
                          selectedDecoration: BoxDecoration(
                            // color: Colors.orange,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(35),
                          ),
                          selectedTextStyle: TextStyle(color: Colors.black),
                          todayDecoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(35),
                          ),
                          weekendDecoration:
                              BoxDecoration(shape: BoxShape.circle
                                  // borderRadius: BorderRadius.circular(35),
                                  ),
                          rangeHighlightColor: Colors.blue,
                          canMarkersOverflow: true,
                          outsideDaysVisible: false,
                          rangeHighlightScale: 1.0,
                          rangeStartDecoration: BoxDecoration(
                            color: Colors.teal,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(35),
                          ),
                          rangeEndDecoration: BoxDecoration(
                            color: Colors.teal,
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        headerStyle: HeaderStyle(
                          formatButtonVisible: true,
                          titleCentered: true,
                          formatButtonShowsNext: true,
                          formatButtonDecoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          formatButtonTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        rangeSelectionMode: rangeSelectionMode,
                        rangeStartDay: rangeStart,
                        rangeEndDay: rangeEnd,
                        onRangeSelected: (first, end, focusDay) {
                          logger.w(first);
                          logger.e(end);
                          logger.i(focusDay);
                          setState(() {
                            selectedDay = null;
                            fNowDay = focusDay;
                            rangeStart = first;
                            rangeEnd = end;
                            rangeSelectionMode = RangeSelectionMode.toggledOn;
                          });
                        },
                        onPageChanged: (focusDay) {
                          setState(() {
                            fNowDay = focusDay;
                          });
                        },
                        headerVisible: true,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                          height: (height - (appbar + statusbarheight)) * 0.40,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.teal.shade700,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CheckboxListTile(
                                checkColor: Colors.white,
                                contentPadding: EdgeInsets.zero,
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  "Tasks",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                value: isChecked,
                                // onChanged: (value) =>
                                //     setState(() => isChecked = value)),
                                // onChanged: (val) => isChecked = val,
                                onChanged: onChanged,
                              ),
                              Text(
                                "Tuesday,17 Aug 2021",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Text("09:00"),
                                        Text("10:00"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: (height - appbar) * 0.05,
                                    width: (width) * 0.7,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Updated Report",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Text("09:00"),
                                        Text("09:00"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: (height - appbar) * 0.05,
                                    width: (width) * 0.7,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        hintText: "Updated Report",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                    Positioned(
                      bottom: 280,
                      right: 30,
                      child: Container(
                        child: Image.asset("assets/add.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
