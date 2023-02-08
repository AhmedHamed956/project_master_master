//////////////////////////////////////////////////////////////////////
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:project/generated/l10n.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/components/component.dart';
import 'package:project/src/ui/navigation_screen/orders/order-screen.dart';

class Test extends StatefulWidget {
  final bool? reschudual;
  final String? id;
  Test({this.reschudual, this.id});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _TestState createState() => new _TestState();
}

class _TestState extends State<Test> {
  // DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  String aaaa = DateFormat.yMd().format(DateTime.now());

  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  TextEditingController hoursController = TextEditingController();
  TextEditingController minController = TextEditingController();
  bool? am;
  bool? pm;

  @override
  void initState() {
    hoursController.text = '01';
    minController.text = '00';

    am = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final calendarCarouselNoHeader = CalendarCarousel<Event>(
      // todayBorderColor: Colors.green,
      onDayPressed: (date, events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));

        print(date);
      },
      showOnlyCurrentMonthDate: true,
      selectedDayTextStyle: const TextStyle(
        color: Colors.blue,
      ),
      selectedDayButtonColor: Colors.transparent,
      weekendTextStyle: TextStyle(
        color: Colors.black,
      ),
      thisMonthDayBorderColor: Colors.grey,

      weekFormat: false,
      todayButtonColor: Colors.blue.withOpacity(0.5),
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.yellow)),

      showHeader: false,

      // minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      // maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
      // inactiveDaysTextStyle: TextStyle(
      //   color: Colors.tealAccent,
      //   fontSize: 16,
      // ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              //   top: 30.0,
              //   bottom: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  _currentMonth,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                )),
                TextButton(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _targetDateTime = DateTime(
                          _targetDateTime.year, _targetDateTime.month - 1);
                      _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                    });
                  },
                ),
                TextButton(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _targetDateTime = DateTime(
                          _targetDateTime.year, _targetDateTime.month + 1);
                      _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                    });
                  },
                )
              ],
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: calendarCarouselNoHeader,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  'الوقت',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
                Spacer(),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    width: 74,
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 25,
                          // height: 30,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: minController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: '00'),
                          ),
                        ),
                        Text(":"),
                        Container(
                          // height: 30,
                          width: 25,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              value = hoursController.text;
                              print(value);
                            },
                            controller: hoursController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "01"),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                    height: 45,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: Container(
                            child: Container(
                                height: 30,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: am == true
                                        ? Colors.white
                                        : Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(child: Text("AM"))),
                          ),
                          onTap: () {
                            setState(() {
                              pm = false;
                              am = true;
                            });
                          },
                        ),
                        InkWell(
                          child: Container(
                            child: Container(
                                height: 30,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: pm == true
                                        ? Colors.white
                                        : Colors.grey.shade200,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(child: Text("PM"))),
                          ),
                          onTap: () {
                            setState(() {
                              pm = true;
                              am = false;
                            });
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                child: ingridentbutton(
                    function: () {
                      setState(() {
                        scheduled = _currentDate2.toString();
                        scheduled = scheduled.split(' ').first as String;
                        time = hoursController.text + ':' + minController.text;
                        scheduled = scheduled + " " + time;
                        if (am == true) {
                          am_pm = 'am';
                        } else {
                          am_pm = 'pm';
                        }
                        print(scheduled);
                      });
                      if (widget.reschudual == true) {
                        HomeCubit().updateScaduale(
                            id: widget.id,
                            schedule: scheduled,
                            context: context);
                      }
                    },
                    color1: button1color,
                    color2: button2color,
                    text: S.current.schedule_an_order),
              ),
              Container(
                width: 150,
                child: ingridentbutton(
                    function: () {
                      Navigator.pop(context);
                    },
                    color1: textColor,
                    color2: Colors.grey.shade400,
                    text: S.current.cancel),
              )
            ],
          )
        ],
      ),
    ));
  }
}
