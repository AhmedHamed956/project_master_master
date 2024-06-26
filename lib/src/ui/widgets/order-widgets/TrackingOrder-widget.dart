import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:project/Models/response/ClientTrackingOrderResponse.dart';
import 'package:project/src/common/route_argument.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/screens/chat_cycle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Models/orders_response.dart';
import '../../../../generated/l10n.dart';
import '../../Shared/constant.dart';

import '../../components/appar.dart';

class TrackingOrder extends StatefulWidget {
  final String? id;

  const TrackingOrder({super.key, this.id});

  @override
  State<TrackingOrder> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {
  List<String> list = [];
  int perPageItem = 16;
  late int pageCount;
  int selectedIndex = 0;
  late int lastPageItemLength;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    for (int i = 1; i <= 45; i++) {
      list.add('$i');
    }
    var num = (list.length / perPageItem);
    pageCount = num is int ? num.toInt() : num.toInt() + 1;

    var reminder = list.length.remainder(perPageItem);
    lastPageItemLength = reminder == 0 ? perPageItem : reminder;

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getclientTraking(id: widget.id),
        child: BlocConsumer<HomeCubit, HomeAppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
                condition:
                    HomeCubit.get(context).clientTrackingOrderResponse != null,
                builder: (context) {
                  return trackingScreen(
                      HomeCubit.get(context).clientTrackingOrderResponse!);
                },
                fallback: ((context) => Container(
                    color: Colors.white,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: button2color,
                    )))));
          },
        ));
  }

  Widget trackingScreen(ClientTrackingOrderResponse model) => Scaffold(
        backgroundColor: mainBackgourndColor,
        appBar: AppBarWidget(label: S.current.order_tracking),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 28,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset:
                            const Offset(0, -4), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                // width: 360,

                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 12, left: 11, top: 19),
                      child: Container(
                        // height: 146,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: buttonLightcolor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 18, left: 22, top: 7),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          // backgroundColor: Colors.brown.shade800,
                                          child: Image.network(
                                              height: 50,
                                              width: 50,
                                              fit: BoxFit.cover,
                                              "${domainlink}${model.data?.shopData?.background}")),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      ConstrainedBox(
                                        constraints:
                                            const BoxConstraints(maxWidth: 150),
                                        child: Text(
                                          '${model.data?.shopData?.storeName}',
                                          style: const TextStyle(
                                            color: textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '#${model.data?.id}',
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    S.current.total_calculted_amount,
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      model.data?.orderDetail?.typePay == "cash"
                                          ? Text(
                                              S.current.cash,
                                              style: const TextStyle(
                                                color: button1color,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          : const Text(
                                              'visa',
                                              style: TextStyle(
                                                color: button1color,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                      const SizedBox(
                                        width: 29,
                                      ),
                                      Text(
                                        '${model.data?.totalPrice} ${S.current.rs}',
                                        style: const TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    S.current.delivery_date,
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    " ${model.message?.dateOrder}",
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      S.current.ordered_items,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 11),
                    //   child: Container(
                    //     height: 100,
                    //     child: PageView.builder(
                    //         controller: pageController,
                    //         itemCount: pageCount,
                    //         onPageChanged: (index) {
                    //           setState(() {
                    //             selectedIndex = index;
                    //           });
                    //         },
                    //         itemBuilder: (_, pageIndex) {
                    //           return ListView.separated(
                    //               scrollDirection: Axis.horizontal,
                    //               shrinkWrap: true,
                    //               itemBuilder: (context, index) => Stack(
                    //                     children: [
                    //                       Container(
                    //                         width: 131,
                    //                         height: 98,
                    //                         decoration: BoxDecoration(
                    //                             borderRadius:
                    //                                 BorderRadius.circular(10)),
                    //                         child: Image.asset(
                    //                             'assets/icons/Rectangle 7888.png'),
                    //                       ),
                    //                       Align(
                    //                         alignment: Alignment.bottomCenter,
                    //                         child: Padding(
                    //                           padding: const EdgeInsets.only(
                    //                               bottom: 4, left: 11),
                    //                           child: Container(
                    //                             width: 63,
                    //                             height: 20,
                    //                             decoration: BoxDecoration(
                    //                                 color: textColor,
                    //                                 borderRadius:
                    //                                     BorderRadius.circular(
                    //                                         10)),
                    //                             child: Row(
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment.center,
                    //                               children: [
                    //                                 Text(
                    //                                   '30 ${S.current.rs}',
                    //                                   style: TextStyle(
                    //                                       color: Colors.white),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //               separatorBuilder: (context, index) =>
                    //                   SizedBox(
                    //                     width: 5,
                    //                   ),
                    //               itemCount: 10);
                    //         }),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: pageCount,
                    //     itemBuilder: (_, index) {
                    //       return GestureDetector(
                    //         onTap: () {
                    //           pageController.animateToPage(index,
                    //               duration: Duration(milliseconds: 500),
                    //               curve: Curves.easeInOut);
                    //         },
                    //         child: AnimatedContainer(
                    //           duration: Duration(milliseconds: 100),
                    //           decoration: BoxDecoration(
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(10)),
                    //               color: selectedIndex == index
                    //                   ? button1color
                    //                   : buttonLightcolor),
                    //           margin: EdgeInsets.all(5),
                    //           width: 5,
                    //           height: 5,
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 30),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                model.message?.searchDelivery == true
                                    ? Container(
                                        height: 17,
                                        width: 17,
                                        decoration: BoxDecoration(
                                            gradient: quickButton,
                                            shape: BoxShape.circle),
                                      )
                                    : Container(
                                        height: 17,
                                        width: 17,
                                        decoration: const BoxDecoration(
                                            color: trackpointColor,
                                            shape: BoxShape.circle),
                                      ),
                                const SizedBox(
                                  width: 28,
                                ),
                                Text(
                                  S.current.looking_fo_delivery_man,
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 10,
                                    child: const VerticalDivider(
                                        color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                model.message?.orderProgress == true
                                    ? Container(
                                        height: 17,
                                        width: 17,
                                        decoration: BoxDecoration(
                                            gradient: quickButton,
                                            shape: BoxShape.circle),
                                      )
                                    : Container(
                                        height: 17,
                                        width: 17,
                                        decoration: const BoxDecoration(
                                            color: trackpointColor,
                                            shape: BoxShape.circle),
                                      ),
                                const SizedBox(
                                  width: 28,
                                ),
                                Text(
                                  S.current.the_request_is_being_prepared,
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 10,
                                    child: const VerticalDivider(
                                        color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                model.message?.isRedirectClient == true
                                    ? Container(
                                        height: 17,
                                        width: 17,
                                        decoration: BoxDecoration(
                                            gradient: quickButton,
                                            shape: BoxShape.circle),
                                      )
                                    : Container(
                                        height: 17,
                                        width: 17,
                                        decoration: const BoxDecoration(
                                            color: trackpointColor,
                                            shape: BoxShape.circle),
                                      ),
                                const SizedBox(
                                  width: 28,
                                ),
                                Text(
                                  S.current.on_the_way_to_delivery,
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            model.message?.isRedirectClient == true
                                ? Row(
                                    children: [
                                      Container(
                                          height: 50,
                                          child: const VerticalDivider(
                                              color: Colors.grey)),
                                      const SizedBox(
                                        width: 55,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${S.current.delivery_man_information} ${model.message?.deliveryName}',
                                            style: const TextStyle(
                                              color: textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Text(
                                            'سعد ناصر شبرا - روض الفرج',
                                            style: TextStyle(
                                              color: button1color,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Container(
                                          height: 10,
                                          child: const VerticalDivider(
                                              color: Colors.grey)),
                                    ],
                                  ),
                            Row(children: [
                              model.message?.isDone == true
                                  ? Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          gradient: quickButton,
                                          shape: BoxShape.circle),
                                    )
                                  : Container(
                                      height: 17,
                                      width: 17,
                                      decoration: const BoxDecoration(
                                          color: trackpointColor,
                                          shape: BoxShape.circle),
                                    ),
                              const SizedBox(
                                width: 28,
                              ),
                              Text(
                                  S.current
                                      .your_request_has_been_recieved_safely,
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ))
                            ]),
                            Row(
                              children: [
                                Container(
                                    height: 10,
                                    child: const VerticalDivider(
                                        color: Colors.grey)),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 17,
                                  width: 17,
                                  decoration: const BoxDecoration(
                                      color: trackpointColor,
                                      shape: BoxShape.circle),
                                ),
                                const SizedBox(width: 28),
                                Expanded(
                                    child: Text(
                                  S.current
                                      .the_request_was_successfully_executed,
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 60,
                    // ),
                    model.message?.isRedirectClient == true
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 34),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    child: Container(
                                        width: 150,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            gradient: maingradientColor,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Center(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                              Text(S.current.chat,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              const SizedBox(width: 19),
                                              Container(
                                                  height: 24,
                                                  width: 24,
                                                  child: const Icon(
                                                      Icons.chat_rounded,
                                                      color: Colors.white))
                                            ]))),
                                    onTap: () {
                                      List<String> data = [
                                        "116",
                                        // model.message?.userIdDelivery ?? "",
                                        "رسالة جديدة من العميل",
                                        "fSaH0rfnRVGrvp6F5entVm:APA91bH7uEY7vvHVfWDgNNx7HLIxuecO9Gg3YXHfo6uI5xYJnv3r4HvKtHDFw19KM9nDt9jgCaaFF97izr7H9zG-l_Gayuw_q2z2rd-DQ9LkdTPgroKbtd5eU6U0GisPjnyPCXMuW_pO‏"
                                        // model.message?.fcmTokenDelivery ?? ""
                                      ];
                                      log("dataaaaaaa  $data");

                                      Navigator.pushNamed(
                                          context, ChatCycle.routeName,
                                          arguments:
                                              RouteArgument(param: data));
                                    }),
                                Container(
                                    width: 150,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        gradient: quickButton,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          S.current.call,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 19,
                                        ),
                                        Container(
                                          height: 24,
                                          width: 24,
                                          child: const Icon(
                                            Icons.call,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ))),
                              ],
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
