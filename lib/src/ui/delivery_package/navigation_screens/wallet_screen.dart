import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';

class DeliveryWallet extends StatefulWidget {
  const DeliveryWallet({super.key});

  @override
  State<DeliveryWallet> createState() => _DeliveryWalletState();
}

class _DeliveryWalletState extends State<DeliveryWallet> {
  final CalendarWeekController _controller = CalendarWeekController();

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.jumpToDate(DateTime.now());
            setState(() {});
          },
          child: Icon(Icons.today),
        ),
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.blue,
        //   title: Text('CalendarWeek'),
        // ),
        body: Column(children: [
          Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1)
              ]),
              child: CalendarWeek(
                controller: _controller,
                height: 100,
                todayBackgroundColor: Colors.black,
                showMonth: true,
                minDate: DateTime.now().add(
                  Duration(days: -365),
                ),
                maxDate: DateTime.now().add(
                  Duration(days: 365),
                ),
                onDatePressed: (DateTime datetime) {
                  // Do something
                  setState(() {});
                },
                onDateLongPressed: (DateTime datetime) {
                  // Do something
                },
                onWeekChanged: () {
                  // Do something
                },
              )),
          Expanded(
            child: Center(
              child: Text(
                '${_controller.selectedDate.day}/${_controller.selectedDate.month}/${_controller.selectedDate.year}',
                style: TextStyle(fontSize: 30),
              ),
            ),
          )
        ]),
      );
}
