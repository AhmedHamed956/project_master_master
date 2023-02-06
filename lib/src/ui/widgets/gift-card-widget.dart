import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:project/Models/profile_Gift_Model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Cubit.dart';

import 'package:project/src/ui/components/component.dart';
import 'package:project/src/ui/widgets/widgets.dart';

import '../../../generated/l10n.dart';
import '../Shared/constant.dart';

class GiftCardWidget extends StatefulWidget {
  final HomeCubit homeCubit;
  final ProfileGiftData model;

  const GiftCardWidget({required this.model, required this.homeCubit});

  @override
  State<GiftCardWidget> createState() => _GiftCardWidgetState();
}

class _GiftCardWidgetState extends State<GiftCardWidget> {
  TextEditingController textController = TextEditingController();

  String? amountRemain;
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xaff59b81e), Color(0xaffb0c81f)],
  ).createShader(
    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
  );

  @override
  Widget build(BuildContext context) {
    amountRemain = "${widget.model.totalPrice} ${S.current.rs}";
    return Container(
        height: 110,
        decoration: BoxDecoration(
            border: Border.all(color: buttonLightcolor),
            borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network('$domainlink${widget.model.productData!.image}'),
          const SizedBox(width: 16),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    langKey == 'ar'
                        ? '${widget.model.productData!.translations!.first.name}'
                        : '${widget.model.productData!.translations!.last.name}',
                    style: const TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 9),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.current.gift_voucher,
                                style: const TextStyle(
                                  color: textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('${widget.model.totalPrice} ${S.current.rs}',
                                style: const TextStyle(
                                    color: textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500))
                          ]),
                      const SizedBox(width: 15),
                      Container(
                          width: 88,
                          height: 36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [button2color, button1color])),
                          child: MaterialButton(
                              child: Text(S.current.pay,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    backgroundColor: Colors.white,
                                    builder: (BuildContext context) {
                                      return bottomWidget();
                                    },
                                    context: context);
                              }))
                    ])
              ]),
          // const SizedBox(width: 16)
        ]));
  }

  Widget bottomWidget() {
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: ImagePixels.container(
                          colorAlignment: Alignment.topLeft,
                          defaultColor: Colors.grey,
                          imageProvider: NetworkImage(
                              "$domainlink${widget.model.productData!.image}"),
                          child: Image.network(
                              "$domainlink${widget.model.productData!.image}"),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 23, vertical: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${widget.model.totalPrice} ${S.current.rs}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: textColor)),
                              Text('${widget.model.shopData!.name} ',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: textColor))
                            ])),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: SizedBox(
                          height: 56,
                          width: 378,
                          child: defaulttextfield(
                              onchanged: (value) {
                                print('First text field: $value');
                                setState(() {
                                  if (value == textController.text) {
                                    if (int.tryParse(value ?? "0")! <= 0) {
                                      amountRemain = "0";
                                    }
                                    if (int.tryParse(value ?? "0")! <
                                        widget.model.totalPrice!) {
                                      amountRemain =
                                          "${(widget.model.totalPrice! - int.parse(value))} ${S.current.rs}";
                                    } else {
                                      amountRemain =
                                          "المبلغ اكبر من قيمه الهدية";
                                    }
                                  }
                                });
                              },
                              hinttext: S.current.select_the_paid_amount,
                              controller: textController,
                              type: const TextInputType.numberWithOptions(
                                  signed: false))),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 26, top: 34, bottom: 27),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(amountRemain.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      foreground: Paint()
                                        ..shader = linearGradient)),
                              Text(S.current.remain_amount,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      foreground: Paint()
                                        ..shader = linearGradient))
                            ])),
                    Padding(
                        padding: const EdgeInsets.only(
                            right: 25, left: 25, bottom: 35),
                        child: ingridentbutton(
                            width: 366,
                            height: 45,
                            function: () {
                              if (textController.text.isNotEmpty) {
                                if (int.tryParse(textController.text )! <=
                                    widget.model.totalPrice!) {
                                  widget.homeCubit.postGiftorder(
                                      context: context,
                                      productID: widget.model.id,
                                      amount: textController.text);
                                } else {
                                  Navigator.pop(context);
                                  textController.clear();
                                  showSnackBar(
                                      title: "المبلغ اكبر من قيمه الهدية");
                                }
                              }
                            },
                            text: S.current.confirm_payment,
                            color1: button1color,
                            color2: button2color))
                  ])));
    });
  }
}
