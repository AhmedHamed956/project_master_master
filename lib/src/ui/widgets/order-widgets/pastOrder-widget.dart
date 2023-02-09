import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project/Models/model/order_model.dart';
import 'package:project/Models/orders_response.dart';

import '../../../../generated/l10n.dart';
import '../../Shared/constant.dart';

import 'package:project/src/ui/widgets/order-widgets/RatingOrder-widget.dart';

class PastOrder extends StatefulWidget {
  OrderModel? model;

  PastOrder({this.model});

  @override
  State<PastOrder> createState() => _PastOrderState();
}

class _PastOrderState extends State<PastOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: orderCardColor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                        Text('#${widget.model?.id}',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))
                      ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text('${widget.model?.shopData?.brandName}',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500))
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.model?.createdAt?.split('T').first}',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RatingOrderScreen(
                                          model: widget.model,
                                        )));
                          },
                          child: widget.model?.rating == null
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      gradient: quickButton),
                                  child: Center(
                                      child: Text(S.of(context).rate_order,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400))))
                              : RatingBarIndicator(
                                  rating: double.parse(
                                      widget.model!.rating!.rating.toString()),
                                  unratedColor: Colors.grey.shade300,
                                  itemCount: 5,
                                  itemSize: 14,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const Icon(Icons.star,
                                        color: Colors.amber);
                                  }),
                        )
                      ])
                ])));
  }
}
