import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Models/orders_response.dart';

import '../../../../generated/l10n.dart';
import '../../../../test.dart';
import '../../Shared/constant.dart';

class OrderSchedule extends StatefulWidget {
  Scheduler? model;
  OrderSchedule({this.model});

  @override
  State<OrderSchedule> createState() => _OrderScheduleState();
}

class _OrderScheduleState extends State<OrderSchedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      width: 360,
      decoration: BoxDecoration(
        color: orderCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 15, top: 14, bottom: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.model?.totalPrice} ${S.current.rs}',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '#${widget.model?.id}',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${widget.model?.shopDatta?.brandName}',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.model?.scheduler?.split(' ').first}',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            // backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context, setState) =>
                                    FractionallySizedBox(
                                        heightFactor: 0.7,
                                        child: Test(
                                          reschudual: true,
                                          id: widget.model?.id.toString(),
                                        )),
                              );
                            },
                            context: context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: maingradientColor),
                        child: Center(
                          child: Text(
                            S.of(context).reschedule,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 13),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: cancelButtonColor),
                      child: Center(
                        child: Text(
                          S.of(context).cancel,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
