import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/orders_response.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import '../../../generated/l10n.dart';
import '../Shared/constant.dart';
import '../widgets/order-widgets/TrackingOrder-widget.dart';
import '../widgets/order-widgets/pastOrder-widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  // var total;
  void initState() {
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      _tabController!.index =
          index == 1 ? _tabController!.previousIndex : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var model = HomeCubit.get(context).ordersModel!;
    return BlocProvider(
      create: (context) => HomeCubit()..ordersScreen(),
      child: BlocConsumer<HomeCubit, HomeAppState>(
        listener: (context, state) {
          if (state is OrderScreenSuccessStates) {}
        },
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! OrderScreenLoadingState,
            builder: (context) => HomeCubit.get(context).ordersModel == null
                ? const Center(child: CircularProgressIndicator())
                : screen(
                    HomeCubit.get(context).ordersModel!,
                    HomeCubit.get(context)
                        .ordersModel
                        ?.data
                        ?.first
                        .progress
                        ?.first),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: button2color,
            )),
          );
        },
      ),
    );
  }

  Widget screen(OrdersModel model, Progress? progress) => DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              toolbarHeight: 18,
              elevation: 0.0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              bottom: TabBar(

                  // controller: _tabController,
                  indicatorColor: indicatorColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: purpleColor,
                  unselectedLabelColor: textColor,
                  labelStyle: const TextStyle(),
                  unselectedLabelStyle: const TextStyle(),
                  onTap: (int index) => onTap(index),
                  // indicator: BoxDecoration(
                  //   color: Colors.white,
                  // ),
                  tabs: [
                    _tab(label: S.of(context).previous),
                    _tab(label: S.of(context).in_progress),
                    _tab(label: S.of(context).scheduled),
                    _tab(label: S.of(context).cancelled)
                  ])),
          body: TabBarView(children: [
            // Icon(Icons.flight, size: 350),

            ConditionalBuilder(
              condition: model.data![0].delivery!.isNotEmpty,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(right: 34, left: 34, top: 20),
                child: ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => const PastOrder(),
                    separatorBuilder: (context, index) => const Padding(
                          padding: EdgeInsets.only(
                            right: 34,
                            left: 34,
                          ),
                          child: Divider(
                            height: 37,
                            // color: Colors.grey,
                          ),
                        ),
                    itemCount: 1),
              ),
              fallback: (context) => const Center(
                child: Text("No Data"),
              ),
            ),
            ConditionalBuilder(
                condition: model.data![1].progress!.isNotEmpty,
                builder: (context) => Padding(
                    padding:
                        const EdgeInsets.only(right: 34, left: 34, top: 20),
                    child: ListView.separated(
                        // physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                color: orderCardColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 15, top: 14, bottom: 21),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                '${model.data?[1].progress![index].totalPrice} ${S.current.rs}',
                                                style: const TextStyle(
                                                    color: textColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(
                                                '#${model.data?[1].progress![index].id}',
                                                style: const TextStyle(
                                                    color: textColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400))
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    '${model.data?[1].progress![index].shopData?.storeName}',
                                                    style: const TextStyle(
                                                        color: textColor,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500)))
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                    //         builder: (context) =>
                                                    //             const TrackingOrder()));
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                TrackingOrder(
                                                                    id: model
                                                                        .data![
                                                                            1]
                                                                        .progress?[
                                                                            index]
                                                                        .id
                                                                        .toString())));
                                                  },
                                                  child: Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12,
                                                          vertical: 8),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          gradient:
                                                              maingradientColor),
                                                      child: Center(
                                                          child: Text(
                                                              S
                                                                  .of(context)
                                                                  .track_order,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700))))),
                                              const SizedBox(width: 13),
                                              Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12,
                                                      vertical: 8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      color: cancelButtonColor),
                                                  child: Center(
                                                      child: Text(
                                                          S.current.cancel,
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400))))
                                            ])
                                          ])
                                    ]))),
                        separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.only(right: 34, left: 34),
                            child: Divider(height: 37)),
                        itemCount: model.data![1].progress!.length)),
                fallback: (context) => const Center(child: Text("No Data"))),
            ConditionalBuilder(
              condition: model.data![2].scheduler!.isNotEmpty,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(right: 34, left: 34, top: 20),
                child: ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                          height: 123,
                          width: 360,
                          decoration: BoxDecoration(
                            color: orderCardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 15, top: 14, bottom: 21),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${model.data?[2].scheduler?.first.total} ${S.current.rs}',
                                      style: const TextStyle(
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '#${model.data?[2].scheduler?.first.id}',
                                      style: const TextStyle(
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
                                      '${model.data?[2].scheduler?.first.shopData?.storeName}',
                                      style: const TextStyle(
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '05/06/2022',
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
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
                                        const SizedBox(width: 13),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
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
                        ),
                    separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(
                          right: 34,
                          left: 34,
                        ),
                        child: Divider(height: 37)),
                    itemCount: model.data![2].scheduler!.length),
              ),
              fallback: (context) => const Center(
                child: Text("No Data"),
              ),
            ),
            ConditionalBuilder(
              condition: model.data![3].cancle!.isNotEmpty,
              builder: (context) => Padding(
                padding: const EdgeInsets.only(right: 34, left: 34, top: 20),
                child: ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(
                            right: 34,
                            left: 34,
                          ),
                          child: Container(
                            height: 123,
                            width: 360,
                            decoration: BoxDecoration(
                              color: orderCardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 15, top: 14, bottom: 21),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${model.data?[2].scheduler?.first.total} ${S.current.rs}',
                                        style: const TextStyle(
                                            color: textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Text(
                                        '#362840',
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
                                      const Text(
                                        'اسم المتجر',
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '05/06/2022',
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(
                          right: 34,
                          left: 34,
                        ),
                        child: Divider(height: 37)),
                    itemCount: model.data![3].cancle!.length),
              ),
              fallback: (context) => const Center(
                child: Text("No Data"),
              ),
            ),
            // ListView.separated(
            //     // physics: const NeverScrollableScrollPhysics(),
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) => const CancelOrder(),
            //     separatorBuilder: (context, index) => const Padding(
            //           padding: EdgeInsets.only(
            //             right: 34,
            //             left: 34,
            //           ),
            //           child: Divider(
            //             height: 37,
            //             // color: Colors.grey,
            //           ),
            //         ),
            //     itemCount: 10),
          ])));

  Widget _tab({required String label}) {
    return Tab(child: Text(label, style: const TextStyle(), maxLines: 1));
  }
}

// import 'dart:ui';

// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project/Models/orders_response.dart';
// import 'package:project/src/ui/Home/states.dart';

// import '../../../generated/l10n.dart';
// import '../Home/Cubit.dart';

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({super.key});

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit()..ordersScreen(),
//       child: BlocConsumer<HomeCubit, HomeAppState>(
//           builder: (context, state) {
//             return ConditionalBuilder(
//                 condition: state is! OrderScreenLoadingState,
//                 builder: (context) {
//                   return screen(HomeCubit.get(context).ordersModel!, context);
//                 },
//                 fallback: ((context) => Center(
//                       child: CircularProgressIndicator(),
//                     )));
//           },
//           listener: (context, state) {}),
//     );
//   }
// }

// Widget screen(OrdersModel model, context) => Scaffold(
//       body: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               tabs: [
//                 _tab(label: S.of(context).previous),
//                 _tab(label: S.of(context).in_progress),
//                 _tab(label: S.of(context).scheduled),
//                 _tab(label: S.of(context).cancelled)
//               ],
//             ),
//             // title: const Text('Tabs Demo'),
//           ),
//           body: TabBarView(
//             children: [
//               ConditionalBuilder(
//                   condition: model.data![0].delivery!.isNotEmpty,
//                   builder: (context) {
//                     return Container();
//                   },
//                   fallback: (context) => Center(
//                         child: CircularProgressIndicator(),
//                       )),
//               ConditionalBuilder(
//                   condition: model.data![1].progress!.isNotEmpty,
//                   builder: (context) {
//                     return Container();
//                   },
//                   fallback: (context) => Center(
//                         child: CircularProgressIndicator(),
//                       )),
//               ConditionalBuilder(
//                   condition: model.data![2].scheduler!.isNotEmpty,
//                   builder: (context) {
//                     return Container();
//                   },
//                   fallback: (context) => Center(
//                         child: CircularProgressIndicator(),
//                       )),
//               ConditionalBuilder(
//                   condition: model.data![3].cancle!.isNotEmpty,
//                   builder: (context) {
//                     return Container();
//                   },
//                   fallback: (context) => Center(
//                         child: CircularProgressIndicator(),
//                       )),
//             ],
//           ),
//         ),
//       ),
//     );

// Widget _tab({required String label}) {
//   return Tab(child: Text(label, style: const TextStyle(), maxLines: 1));
// }
