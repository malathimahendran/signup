import 'package:flutter/material.dart';
import 'package:googleapis/poly/v1.dart';
import 'package:logger/logger.dart';
import 'package:select_form_field/select_form_field.dart';

import 'reminder_page.dart';

class RemainderFormPage extends StatefulWidget {
  @override
  _RemainderFormPageState createState() => _RemainderFormPageState();
}

class _RemainderFormPageState extends State<RemainderFormPage> {
  DateTime startDateTime;
  DateTime endDateTime;

  final List<Map<String, dynamic>> items = [
    {"value": 'Task', "label": "task"},
    {"value": 'Events', "label": "event"}
  ];
  var title = TextEditingController();
  var category = TextEditingController();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var timeController = TextEditingController();
  var description = TextEditingController();
  var logger = Logger();
  var date;
  var time;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          top: statusBarHeight,
        ),
        // color: Colors.green,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: (height - statusBarHeight) * 0.05,
                      width: width,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                          ),
                          SizedBox(
                            width: (width - 50) * 0.05,
                          ),
                          textOnly(
                            text: "Create Remainder",
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: (height - statusBarHeight) * 0.05,
                      width: width,
                      alignment: Alignment.centerLeft,
                      child: textOnly(
                        text: 'Title',
                      ),
                    ),
                    Container(
                      height: (height - statusBarHeight) * 0.06,
                      width: width,
                      child: TextFormField(
                        controller: title,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.teal.shade700),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.teal.shade700),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: (height - statusBarHeight) * 0.05,
                      width: width,
                      alignment: Alignment.centerLeft,
                      child: textOnly(
                        text: "Category",
                      ),
                    ),
                    Container(
                      height: (height - statusBarHeight) * 0.06,
                      width: width,
                      child: SelectFormField(
                        items: items,
                        controller: category,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.teal.shade700),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.teal.shade700),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: (height - statusBarHeight) * 0.05,
                      width: width,
                      child: Row(
                        children: [
                          Container(
                            height: (height - statusBarHeight) * 0.05,
                            width: (width - 50) * 0.475,
                            alignment: Alignment.centerLeft,
                            child: textOnly(
                              text: "Start Date Time",
                            ),
                          ),
                          SizedBox(
                            width: (width - 50) * 0.05,
                          ),
                          Container(
                            height: (height - statusBarHeight) * 0.05,
                            width: (width - 50) * 0.475,
                            alignment: Alignment.centerLeft,
                            child: textOnly(
                              text: "End Date Time",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: (height - statusBarHeight) * 0.07,
                      width: width,
                      child: Row(
                        children: [
                          Container(
                            height: (height - statusBarHeight) * 0.07,
                            width: (width - 50) * 0.475,
                            child: TextFormField(
                              readOnly: true,
                              controller: startDateController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 3),
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: () async {
                                      await pickDateAndTime(
                                        context: context,
                                        number: 0,
                                      );
                                    }),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.teal.shade700),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.teal.shade700),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: (width - 50) * 0.05,
                          ),
                          Container(
                            height: (height - statusBarHeight) * 0.07,
                            width: (width - 50) * 0.475,
                            child: TextFormField(
                              readOnly: true,
                              controller: endDateController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 3),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () async {
                                    await pickDateAndTime(
                                      context: context,
                                      number: 1,
                                    );
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.teal.shade700),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(color: Colors.teal.shade700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: (height - statusBarHeight) * 0.05,
                      width: width,
                      alignment: Alignment.centerLeft,
                      child: textOnly(
                        text: "Descrption",
                      ),
                    ),
                    Container(
                      height: (height - statusBarHeight) * 0.25,
                      width: width,
                      child: TextFormField(
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        controller: description,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.teal.shade700),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.teal.shade700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  try {
                    if (title.text == null ||
                        startDateTime == null ||
                        endDateTime == null ||
                        description.text == null) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Text("Something is not filled");
                          });

                      logger.w('something is left out');
                    } else {
                      CalendarClient().insert(title.text, startDateTime,
                          endDateTime, description.text);
                    }
                  } catch (e) {
                    logger.e(e);
                  }
                });
              },
              child: Container(
                height: (height - statusBarHeight) * 0.06,
                width: (width - 50) * 0.8,
                decoration: BoxDecoration(
                  color: Colors.teal.shade700,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: textOnly(
                    text: "Create",
                    color: Colors.white,
                    size: 15.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: (height - statusBarHeight) * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Text textOnly({text, color, double size}) {
    return Text(
      text,
      style:
          TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: size),
    );
  }

  Future pickDateAndTime({context, int number}) async {
    date = await showDatePicker(
        currentDate: DateTime.now(),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 2),
        lastDate: DateTime(DateTime.now().year + 2),
        selectableDayPredicate: (DateTime val) {
          if (((val.month) == DateTime.now().month) &&
              ((val.day) < DateTime.now().day)) {
            return false;
          } else if ((val.month) < DateTime.now().month) {
            return false;
          }
          return true;
        });
    time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (date != null && time != null) {
      setState(() {
        try {
          if (number == 0) {
            startDateTime = DateTime(
                date.year, date.month, date.day, time.hour, time.minute);

            startDateController.text =
                '${date.day}-${date.month}-${date.year}/${time.hour}:${time.minute}';
            logger.i(startDateTime);
            logger.v(startDateTime.runtimeType);
          } else if (number == 1) {
            endDateTime = DateTime(
                date.year, date.month, date.day, time.hour, time.minute);
            endDateController.text =
                '${date.day}-${date.month}-${date.year}/${time.hour}:${time.minute}';
            logger.i(endDateTime);
            logger.v(endDateTime.runtimeType);
          } else {
            logger.w('input not correct from pickDateTime');
          }
        } catch (e) {
          logger.e(e);
        }
      });
    } else
      return;
  }
}
