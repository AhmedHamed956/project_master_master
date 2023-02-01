import 'package:flutter/material.dart';
import 'package:project/generated/l10n.dart';

import '../../Shared/constant.dart';
import '../data/model/order_request_model.dart';

class OrderRequestWidget extends StatelessWidget {
  OrderRequestModel model;
  int index;
  Function(OrderRequestModel, int) onRefuse;
  Function(OrderRequestModel) onAccept;

  OrderRequestWidget(
      {required this.model,
      required this.index,
      required this.onRefuse,
      required this.onAccept});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: shadowColor.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 0))
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.deliveryData!.shopData!.storeName ?? "",
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 16),
              Text("# ${model.id}",
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                    child: InkWell(
                        onTap: () => onAccept(model),
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                gradient: maingradientColor,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                                child: Text(S.current.accept,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)))))),
                const SizedBox(width: 16),
                Expanded(
                    child: InkWell(
                        onTap: () => onRefuse(model, index),
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                color: cancelButtonColor,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                                child: Text(S.current.cancel,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))))))
              ])
            ]));
  }
}
