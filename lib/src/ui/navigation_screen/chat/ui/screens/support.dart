import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/src/common/route_argument.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/components/component.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/screens/chat_cycle.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/screens/chat_screen.dart';

class SupportAgent extends StatelessWidget {
  const SupportAgent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'chatbot BIFLORA! مرحبًا بك في',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: textColor),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  width: 66,
                  height: 60,
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/icons/home/nan.svg',
                    color: purpleColor,
                  ))),
              const SizedBox(
                height: 28,
              ),
              const Text('كيف يمكننا مساعدتك؟',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: textColor)),
              const SizedBox(height: 60),
              InkWell(
                  onTap: () {
                    List<String> data = [
                      "999999999",
                      "رسالة جديدة من الدعم",
                      ''
                    ];
                    Navigator.pushNamed(context, ChatCycle.routeName,
                        arguments: RouteArgument(param: data));
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 56,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: maingradientColor),
                      child: Row(children: [
                        Icon(Icons.arrow_back_ios, color: Colors.white),
                        SizedBox(width: 18),
                        Text('الاتصال الدردشة الحية',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white))
                      ]))),
              const SizedBox(height: 28),
              Row(children: [
                Text('الطلبات السابقة',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: textColor))
              ]),
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 146,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: buttonLightcolor, width: 1)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 19, vertical: 18),
                          child: Column(children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('اسم متجر البائع',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: textColor)),
                                  Text('05/06/2022',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: textColor))
                                ]),
                            const SizedBox(height: 3),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('إجمالي مبلغ الطلب',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: textColor)),
                                  const SizedBox(width: 10),
                                  Container(
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: buttonLightcolor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Center(
                                          child: Text("Complited",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: textColor)))),
                                  const Spacer(),
                                  const Text('251.00 SAR',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: textColor))
                                ]),
                            const SizedBox(height: 3),
                            const Divider(),
                            const SizedBox(height: 3),
                            Row(children: [
                              Flexible(
                                child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. sed scelerisque urna...'),
                              )
                            ])
                          ]))),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: 3)
            ])));
  }
}
