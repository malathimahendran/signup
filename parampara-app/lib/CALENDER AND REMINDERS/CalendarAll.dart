import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarAll extends StatefulWidget {
  @override
  _CalendarEventsState createState() => _CalendarEventsState();
}

class _CalendarEventsState extends State<CalendarAll> {
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

    var today = DateTime.now();
    return Scaffold(
        body: Container(
            height: height - appbar,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: (height - appbar) * 0.20,
                    width: width,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset('assets/Calender.jpeg'),
                  ),
                  Container(
                    height: (height - appbar) * 0.80,
                    width: width,
                    child: Stack(children: [
                      Container(
                        height: (height - appbar) * 0.45,
                        width: width,
                        // color: Colors.teal,
                        child: TableCalendar(
                          rowHeight: 40,
                          // daysOfWeekHeight: 20,
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: TextStyle(fontSize: 12),
                            weekendStyle: TextStyle(fontSize: 12),
                          ),
                          focusedDay: fNowDay,
                          firstDay: DateTime(2016),
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
                              rangeSelectionMode =
                                  RangeSelectionMode.toggledOff;
                            });
                          },
                          selectedDayPredicate: (date) {
                            return isSameDay(selectedDay, date);
                          },
                          calendarStyle: CalendarStyle(
                            isTodayHighlighted: true,
                            selectedDecoration: BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            selectedTextStyle: TextStyle(color: Colors.white),
                            todayDecoration: BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            defaultDecoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            weekendDecoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            rangeStartDecoration: BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            rangeEndDecoration: BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                          headerStyle: HeaderStyle(
                            formatButtonVisible: true,
                            titleCentered: true,
                            formatButtonShowsNext: true,
                            formatButtonDecoration: BoxDecoration(
                              color: Colors.teal,
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
                            print(first);
                            print(end);
                            print(focusDay);
                            setState(() {
                              selectedDay = null;
                              fNowDay = focusDay;
                              rangeStart = first;
                              rangeEnd = end;
                              rangeSelectionMode = RangeSelectionMode.toggledOn;
                              print(selectedDay);
                              print(fNowDay);
                              print(rangeStart);
                              print(rangeEnd);
                              print(rangeSelectionMode);
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
                            height: (height - appbar) * 0.40,
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
                                    "All",
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
                      )
                    ]),
                  ),
                ],
              ),
            )));
  }
}
