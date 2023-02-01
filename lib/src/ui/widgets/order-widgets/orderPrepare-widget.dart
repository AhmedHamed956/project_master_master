import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:project/src/ui/widgets/order-widgets/TrackingOrder-widget.dart';

import '../../../../generated/l10n.dart';
import '../../Shared/constant.dart';

class OrderPrepare extends StatelessWidget {
  const OrderPrepare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: orderCardColor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 15, top: 14, bottom: 21),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('251.00 ${S.current.rs}',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        Text('#362840',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'اسم المتجر',
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
                        const Text(
                          '05/06/2022',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(children: [
                          InkWell(
                              onTap: () {
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const TrackingOrder()));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TrackingOrder()));
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      gradient: maingradientColor),
                                  child: Center(
                                      child: Text(S.of(context).track_order,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700))))),
                          const SizedBox(width: 13),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: cancelButtonColor),
                              child: Center(
                                  child: Text(S.current.cancel,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400))))
                        ])
                      ])
                ])));
  }
}
