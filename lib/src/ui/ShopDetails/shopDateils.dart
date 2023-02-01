import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:project/Models/Tabs_Details_Model.dart';
import 'package:project/Models/orders_Model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Home.dart';

import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/navigation_screen/main-screens/main_Screen.dart';
import 'package:project/test.dart';
import '../../../Models/shop_details_Model.dart';
import '../../../generated/l10n.dart';
import '../../common/route_argument.dart';
import '../Cart_Shops/Add_To_Cart.dart';
import '../Home/Cubit.dart';
import '../Home/states.dart';
import '../widgets/flowerItem-widget.dart';

class ShopDetails extends StatefulWidget {
  final String id;
  // final String categoryName;
  // final int index;
  ShopDetails({
    super.key,
    required this.id,
  });

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tab2Controller;
  // final date = DateTime.now();

  dynamic tdata = DateFormat("HH:mm:ss").format(DateTime.now());
  int? selected;

  // var total;
  void initState() {
    // selected = null;
    print(langKey);
    print('$tdata');
    // HomeCubit.get(context).shopDetails(id: widget.id);
    print(widget.id);
    _tab2Controller = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..shopDetails(id: widget.id)
        ..tabdetails(id: widget.id)
        ..getCartData(id: widget.id),
      child: BlocConsumer<HomeCubit, HomeAppState>(
        listener: (context, state) {
          if (state is ShopDetailsSuccessStates) {}
          if (state is GetCartSuccessStates) {
            if (HomeCubit.get(context).getCartModel!.data!.isEmpty) {
              total = 0;
              setState(() {
                selected = null;
              });
            } else {
              setState(() {
                total = HomeCubit.get(context)
                    .getCartModel!
                    .data!
                    .first
                    .total!
                    .toInt();

                print(total);
              });
            }
          }
          if (state is TabDetailsSuccessStates) {
            _tabController = TabController(
                length: HomeCubit.get(context).tabsDetailsModel!.data!.length,
                vsync: this);
          }
        },
        builder: (context, state) {
          var model = HomeCubit.get(context).shopDetailsModel;
          var model2 = HomeCubit.get(context).tabsDetailsModel;

          return ConditionalBuilder(
              condition: HomeCubit.get(context).tabsDetailsModel != null &&
                  HomeCubit.get(context).shopDetailsModel != null,
              builder: ((context) =>
                  shopDetailScreen(model!, model2!, widget.id)),
              fallback: (context) => Container(
                    color: Colors.white,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: button2color,
                      ),
                    ),
                  ));
        },
      ),
    );
  }

  Widget shopDetailScreen(
          ShopDetailsModel model, TabsDetailsModel tabmodel, String id) =>
      Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //     elevation: 0,
        //     backgroundColor: Colors.transparent,
        //     leading: InkWell(
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         child: Image.asset(
        //             height: 40, width: 40, 'assets/icons/arrowBack.png')),
        //     actions: [
        //       Image.asset(height: 40, width: 40, 'assets/icons/search.png')
        //     ]),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 221,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${domainlink}${model.data!.background}'),
                                fit: BoxFit.fill)),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.pop(context);
                                Navigator.pushReplacement<void, void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        HomeScreen(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                  height: 40,
                                  width: 40,
                                  'assets/icons/arrowBack.png'),
                            ),
                            Image.asset(
                                height: 40,
                                width: 40,
                                'assets/icons/search.png')
                          ],
                        ),
                      )
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Container(
                      //     color: Colors.red,
                      //     child: Text("sssss"),
                      //   ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      height: 70,
                      width: 405,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                    height: 54,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              '${domainlink}${model.data!.logo}',
                                            ),
                                            fit: BoxFit.fill))),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 200),
                                    child: Text(
                                      model.data!.storeName.toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: textColor),
                                    ),
                                  ),
                                  // Text(
                                  //   model.data!.storeName.toString(),
                                  //   style: TextStyle(
                                  //       fontSize: 16,
                                  //       fontWeight: FontWeight.w600,
                                  //       color: textColor),
                                  // ),
                                  Text(
                                    langKey == 'ar'
                                        ? model.data!.categoryData!
                                            .translations![0].name
                                            .toString()
                                        : model.data!.categoryData!
                                            .translations![1].name
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: textColor),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        // height: 18.3,
                                        // width: 29,
                                        child: Text(
                                          "${'(4.8)'}",
                                          style: TextStyle(
                                              color: textColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        height: 11,
                                        width: 14.25,
                                        child: SvgPicture.asset(
                                          'assets/icons/home/Vector-3.svg',
                                        ),
                                      ),
                                      Container(
                                        height: 11,
                                        width: 14.25,
                                        child: SvgPicture.asset(
                                          'assets/icons/home/Vector-2.svg',
                                        ),
                                      ),
                                      Container(
                                        height: 11,
                                        width: 14.25,
                                        child: SvgPicture.asset(
                                          'assets/icons/home/Vector-2.svg',
                                        ),
                                      ),
                                      Container(
                                        height: 11,
                                        width: 14.25,
                                        child: SvgPicture.asset(
                                          'assets/icons/home/Vector-2.svg',
                                        ),
                                      ),
                                      Container(
                                        height: 11,
                                        width: 14.25,
                                        child: SvgPicture.asset(
                                          'assets/icons/home/Vector-2.svg',
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 12),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Container(
                                    //   height: 22,
                                    //   width: 21,
                                    //   child: SvgPicture.asset(
                                    //       'assets/icons/home/location_ic.svg'),
                                    // ),
                                    // SizedBox(
                                    //   width: 6,
                                    // ),
                                    // tdata >= model.fromHour!.toInt() &&
                                    // tdata <= model.toHour!.toInt()
                                    // ?
                                    //  Container(
                                    //     width: 63,
                                    //     height: 20,
                                    //     decoration: BoxDecoration(
                                    //         gradient: quickButton,
                                    //         borderRadius:
                                    //             BorderRadius.circular(10)),
                                    //     child: Center(
                                    //         child: Text(
                                    //       'مفتوح',
                                    //       style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.w600),
                                    //     )),
                                    //   )
                                    // :
                                    Container(
                                      width: 63,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: shopCloseColorLite,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                          child: Text(
                                        S.current.closed,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ///////////////////////////////////

                          /////////////////////////////////////////////////////////
                        ],
                      ),
                    ),
                    // Container(
                    //     width: MediaQuery.of(context).size.width,

                    //     // height: 75,
                    //     child: Column(
                    //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Row(children: [
                    //           Align(
                    //               alignment: Alignment.topCenter,
                    //               child: Container(
                    //                   height: 54,
                    //                   width: 65,
                    //                   decoration: BoxDecoration(
                    //                       shape: BoxShape.circle,
                    //                       image: DecorationImage(
                    //                           image: NetworkImage(
                    //                             '${domainlink}${model.logo}',
                    //                           ),
                    //                           fit: BoxFit.fill)))),
                    //           Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(model.storeName.toString(),
                    //                     style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.w600,
                    //                         color: textColor)),
                    //                 const SizedBox(height: 6),
                    //                 Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(
                    //                         langKey == 'ar'
                    //                             ? model.categoryData!
                    //                                 .translations![0].name
                    //                                 .toString()
                    //                             : model.categoryData!
                    //                                 .translations![1].name
                    //                                 .toString(),
                    //                         style: const TextStyle(
                    //                             fontSize: 12,
                    //                             fontWeight: FontWeight.w500,
                    //                             color: textColor)),
                    //                     const SizedBox(height: 6),
                    //                   ],
                    //                 ),
                    //               ])
                    //         ]),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 SizedBox(width: 65),
                    //                 const Text(
                    //                   "${'(4.8)'}",
                    //                   style: TextStyle(
                    //                       color: textColor,
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.w400),
                    //                 ),
                    //                 const SizedBox(width: 9),
                    //                 Container(
                    //                   // height: 13,
                    //                   width: 13,
                    //                   child: SvgPicture.asset(
                    //                     'assets/icons/home/Vector-3.svg',
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   height: 16.72,
                    //                   width: 13,
                    //                   child: SvgPicture.asset(
                    //                     'assets/icons/home/Vector-2.svg',
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   height: 16.72,
                    //                   width: 13,
                    //                   child: SvgPicture.asset(
                    //                     'assets/icons/home/Vector-2.svg',
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   height: 16.72,
                    //                   width: 13,
                    //                   child: SvgPicture.asset(
                    //                     'assets/icons/home/Vector-2.svg',
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   height: 16.72,
                    //                   width: 13,
                    //                   child: SvgPicture.asset(
                    //                     'assets/icons/home/Vector-2.svg',
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             Text(
                    //                 "${S.current.minimum_order} ${model.minimumOrder} ${S.current.rs}",
                    //                 style: TextStyle(
                    //                     color: textColor,
                    //                     fontSize: 14,
                    //                     fontWeight: FontWeight.w400))
                    //           ],
                    //         ),
                    //       ],
                    //     ))
                  ),

                  // width: 200,

                  Container(
                      width: 386,
                      height: 45,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/home/location_ic.svg'),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '1.2  ${S.current.km} ',
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: 25,
                                    child: VerticalDivider(color: Colors.grey)),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/icons/home/Vector-9.svg'),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${model.data!.deliveryTime} ${S.current.min}.',
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: 25,
                                    child: VerticalDivider(color: Colors.grey)),
                                Row(
                                  children: [
                                    Image.asset('assets/icons/Group.png'),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '${model.data!.deliveryCost} ${S.current.rs} ',
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),

                                // VerticalDivider(
                                //   color: Colors.grey,
                                //   // thickness: 1,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ConditionalBuilder(
                      builder: (context) {
                        return _tabSection(
                          model.data!.storeName.toString(),
                          context,
                          HomeCubit.get(context).shopDetailsModel!.data!,
                          tabmodel,
                          HomeCubit.get(context).tabsDetailsModel!.data!.first,
                        );
                      },
                      fallback: (context) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: button2color,
                          ),
                        );
                      },
                      condition: State is! TabDetailsLoadingState)
                ],
              ),
            ),
            total != 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          print('aaaa');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddToCart(
                                id: model.data!.id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: button1color,
                              borderRadius: BorderRadius.circular(10)),
                          height: 56,
                          width: 230,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text(
                                    S.current.show_cart,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: VerticalDivider(
                                    color: Colors.white,
                                    thickness: 1,
                                  ),
                                ),
                                Text(
                                  '${S.current.total} ${total} ${S.current.rs}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      );

  Widget _tabSection(String storename, BuildContext context,
      ShopDetailsData model, TabsDetailsModel tabmodel, TabsData products) {
    // return Column(
    //   children: [
    //     Stack(
    //       children: [
    //         TabBar(
    //             indicatorColor: indicatorColor,
    //             indicatorSize: TabBarIndicatorSize.label,
    //             labelColor: purpleColor,
    //             unselectedLabelColor: textColor,
    //             isScrollable: true,
    //             controller: _tabController,
    //             // padding: const EdgeInsets.only(left: 20),
    //             // indicatorPadding: EdgeInsets.only(right: 20),
    //             // labelPadding: EdgeInsets.only(left: 20),
    //             labelStyle: const TextStyle(
    //               fontSize: 16,
    //             ),
    //             unselectedLabelStyle: const TextStyle(
    //               fontSize: 16,
    //             ),
    //             // indicator: BoxDecoration(
    //             //   color: Colors.white,
    //             // ),
    //             tabs: [
    //               for (int i = 0; i < tabmodel.data!.length; i++)
    //                 Tab(
    //                   child: Container(
    //                     child: Text(
    //                       langKey == 'ar'
    //                           ? "${tabmodel.data![i].translations!.first.name}"
    //                           : "${tabmodel.data![i].translations!.last.name}",
    //                       style: TextStyle(
    //                           // color: purpleColor,
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w400),
    //                     ),
    //                   ),
    //                 ),
    //             ]),
    //         const Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
    //           child: Divider(
    //             color: Colors.grey,
    //           ),
    //         ),
    //       ],
    //     ),
    //     // const Padding(
    //     //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
    //     //   child: Divider(
    //     //     color: Colors.grey,
    //     //   ),
    //     // ),
    //     Container(
    //       height: MediaQuery.of(context).size.height,
    //       child: TabBarView(controller: _tab2Controller, children: [
    //         SingleChildScrollView(
    //           child: Container(
    //             child: ListView.separated(
    //                 // physics: const NeverScrollableScrollPhysics(),
    //                 scrollDirection: Axis.vertical,
    //                 shrinkWrap: true,
    //                 itemBuilder: (context, index) => flower(
    //                     HomeCubit.get(context).tabsDetailsModel!.data!.first,
    //                     index,
    //                     storename),
    //                 separatorBuilder: (context, index) => SizedBox(
    //                       height: 30,
    //                       child: const Divider(
    //                         color: Colors.grey,
    //                       ),
    //                     ),
    //                 itemCount: tabmodel.data!.length),
    //           ),
    //         ),
    //       ]),
    //     ),
    //   ],
    // );

    ///////////////////////////////////////////////////////////////////
    // return DefaultTabController(
    //   length: tabmodel.data!.length,
    //   child: NestedScrollView(
    //       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //         return <Widget>[
    //           Container(
    //             width: 378,
    //             height: 30,
    //             child: Row(
    //               children: [
    //                 const SizedBox(
    //                   width: 24,
    //                 ),
    //                 Image.asset('assets/icons/system-uicons_filtering.png'),
    //                 Expanded(
    //                   child: Stack(
    //                     children: [
    //                       TabBar(
    //                           indicatorColor: indicatorColor,
    //                           indicatorSize: TabBarIndicatorSize.label,
    //                           labelColor: purpleColor,
    //                           unselectedLabelColor: textColor,
    //                           isScrollable: true,
    //                           // padding: const EdgeInsets.only(left: 20),
    //                           // indicatorPadding: EdgeInsets.only(right: 20),
    //                           // labelPadding: EdgeInsets.only(left: 20),
    //                           labelStyle: const TextStyle(
    //                             fontSize: 16,
    //                           ),
    //                           unselectedLabelStyle: const TextStyle(
    //                             fontSize: 16,
    //                           ),
    //                           // indicator: BoxDecoration(
    //                           //   color: Colors.white,
    //                           // ),
    //                           tabs: [
    //                             for (int i = 0; i < tabmodel.data!.length; i++)
    //                               Tab(
    //                                 child: Container(
    //                                   child: Text(
    //                                     langKey == 'ar'
    //                                         ? "${tabmodel.data![i].translations!.first.name}"
    //                                         : "${tabmodel.data![i].translations!.last.name}",
    //                                     style: TextStyle(
    //                                         // color: purpleColor,
    //                                         fontSize: 14,
    //                                         fontWeight: FontWeight.w400),
    //                                   ),
    //                                 ),
    //                               ),
    //                           ]),
    //                       const Padding(
    //                         padding: EdgeInsets.symmetric(
    //                             horizontal: 20.0, vertical: 30),
    //                         child: Divider(
    //                           color: Colors.grey,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ];
    //       },
    //       body: Container(
    //         height: MediaQuery.of(context).size.height,
    //         child: TabBarView(children: [
    //           SingleChildScrollView(
    //             child: Container(
    //               child: ListView.separated(
    //                   // physics: const NeverScrollableScrollPhysics(),
    //                   scrollDirection: Axis.vertical,
    //                   shrinkWrap: true,
    //                   itemBuilder: (context, index) => flower(
    //                       HomeCubit.get(context).tabsDetailsModel!.data![index],
    //                       index,
    //                       storename),
    //                   separatorBuilder: (context, index) => SizedBox(
    //                         height: 30,
    //                         child: const Divider(
    //                           color: Colors.grey,
    //                         ),
    //                       ),
    //                   itemCount: 1),
    //             ),
    //           ),
    //         ]),
    //       )),
    // );
    //////////////////////////////////////////
    return DefaultTabController(
      length: tabmodel.data!.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 378,
            height: 30,
            child: Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                Image.asset('assets/icons/system-uicons_filtering.png'),
                Expanded(
                  child: Stack(
                    children: [
                      TabBar(
                          indicatorColor: indicatorColor,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: purpleColor,
                          unselectedLabelColor: textColor,
                          isScrollable: true,
                          controller: _tabController,
                          // padding: const EdgeInsets.only(left: 20),
                          // indicatorPadding: EdgeInsets.only(right: 20),
                          // labelPadding: EdgeInsets.only(left: 20),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          // indicator: BoxDecoration(
                          //   color: Colors.white,
                          // ),
                          tabs: [
                            for (int i = 0; i < tabmodel.data!.length; i++)
                              Tab(
                                child: Container(
                                  child: Text(
                                    langKey == 'ar'
                                        ? "${tabmodel.data![i].translations!.first.name}"
                                        : "${tabmodel.data![i].translations!.last.name}",
                                    style: TextStyle(
                                        // color: purpleColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                          ]),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              for (int i = 0; i < tabmodel.data!.length; i++)
                SingleChildScrollView(
                  child: Container(
                    height: 350,
                    child: ListView.separated(
                        // physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => flower(
                            HomeCubit.get(context).tabsDetailsModel!,
                            index,
                            storename),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 30,
                              child: const Divider(
                                color: Colors.grey,
                              ),
                            ),
                        itemCount:
                            tabmodel.data![i].sameSubCategoryProducts!.length),
                  ),
                ),
            ]),
          )
        ],
      ),
    );
  }

  Widget flower(TabsDetailsModel model, int index, String storename) =>
      // model
      //             .subCategoryShop!.first.subProducts![index].shopId
      //             .toString() ==
      //         widget.id
      // ?
      InkWell(
          onTap: () {
            showModalBottomSheet<void>(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: Colors.grey,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "${domainlink}${model.data![index].sameSubCategoryProducts![index].masterImage}"),
                                ),
                              ),
                              // child:
                              //     Image.asset('assets/icons/Rectangle 7863-2 2.png'),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 25, left: 23, right: 23),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        model
                                            .data![index]
                                            .sameSubCategoryProducts![index]
                                            .name
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: textColor),
                                        // maxLines: 1,
                                      )),
                                      Text(
                                        '${model.data![index].sameSubCategoryProducts![index].priceAfterDiscount} ${S.current.rs}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: indicatorColor),
                                      ),
                                    ])),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 23),
                                child: Row(children: [
                                  Text(
                                      '${model.data![index].sameSubCategoryProducts![index].price} ${S.current.rs}',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: textColor))
                                ])),
                            const SizedBox(height: 9),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 23, right: 23),
                              child: Container(
                                height: 50,
                                width: 377,
                                child: Text(
                                  '${model.data![index].sameSubCategoryProducts![index].dis}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: textColor),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        gradient: quickButton),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            S.current.quick_order,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          backgroundColor: Colors.transparent,
                                          builder: (BuildContext context) {
                                            return FractionallySizedBox(
                                                heightFactor: 0.7,
                                                child: Test());
                                          },
                                          context: context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: const LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                button2color,
                                                button1color
                                              ])),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              // height: 20,
                                              // width: 20,
                                              child: SvgPicture.asset(
                                                'assets/icons/home/Vector-4.svg',
                                                height: 20,
                                                width: 20,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              S.current.schedule_an_order,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 21,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 13, right: 16),
                              child: Container(
                                width: 399,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: lighttextColor,
                                      width: 1,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 19.5, right: 18),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ConstrainedBox(
                                        constraints:
                                            BoxConstraints(maxWidth: 200),
                                        child: Text(
                                          storename,
                                          style: TextStyle(
                                              color: textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            // height: 18.3,
                                            // width: 29,
                                            child: const Text(
                                              "${'(4.8)'}",
                                              style: TextStyle(
                                                  color: textColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 9,
                                          ),
                                          Container(
                                            height: 11,
                                            width: 14.25,
                                            child: SvgPicture.asset(
                                              'assets/icons/home/Vector-3.svg',
                                            ),
                                          ),
                                          Container(
                                            height: 11,
                                            width: 14.25,
                                            child: SvgPicture.asset(
                                              'assets/icons/home/Vector-2.svg',
                                            ),
                                          ),
                                          Container(
                                            height: 11,
                                            width: 14.25,
                                            child: SvgPicture.asset(
                                              'assets/icons/home/Vector-2.svg',
                                            ),
                                          ),
                                          Container(
                                            height: 11,
                                            width: 14.25,
                                            child: SvgPicture.asset(
                                              'assets/icons/home/Vector-2.svg',
                                            ),
                                          ),
                                          Container(
                                            height: 11,
                                            width: 14.25,
                                            child: SvgPicture.asset(
                                              'assets/icons/home/Vector-2.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 28, right: 34),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    HomeCubit().postOrder(
                                        productID: model.data![index]
                                            .sameSubCategoryProducts![index].id,
                                        quantity: 1,
                                        context: context,
                                        id: widget.id);
                                    // total += int.parse(
                                    //     model.priceAfterDiscount.toString());
                                  });
                                },
                                child: Container(
                                    height: 45,
                                    width: 366,
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            colors: [
                                          button2color,
                                          button1color
                                        ])),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/home/cart_ic.svg',
                                                height: 15.0,
                                                width: 26.0,
                                                // allowDrawingOutsideViewBox: true,
                                              ),
                                              // Container(
                                              //     height: 15,
                                              //     width: 26,
                                              //     child: Image.asset(
                                              //         'assets/icons/Vector-6.png')),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                S.current.add_to_basket,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '${model.data![index].sameSubCategoryProducts![index].priceAfterDiscount} ${S.current.rs}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Padding(
                              padding: EdgeInsets.only(left: 24, right: 25.99),
                              child: Divider(),
                            ),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       S.current.similar_items,
                            //       style: const TextStyle(
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.w400,
                            //           color: textColor),
                            //     ),
                            //     Container(
                            //       width: 375,
                            //       height: 100,
                            //       // width: d,
                            //       child: ListView.separated(
                            //           // physics:
                            //           //     const NeverScrollableScrollPhysics(),
                            //           scrollDirection: Axis.horizontal,
                            //           shrinkWrap: true,
                            //           itemBuilder: (context, index) => Stack(
                            //                 children: [
                            //                   Container(
                            //                     width: 131,
                            //                     height: 98,
                            //                     decoration: BoxDecoration(
                            //                         borderRadius:
                            //                             BorderRadius.circular(
                            //                                 10)),
                            //                     child: Image.asset(
                            //                         'assets/icons/Rectangle 7888.png'),
                            //                   ),
                            //                   Align(
                            //                     alignment:
                            //                         Alignment.bottomCenter,
                            //                     child: Container(
                            //                       width: 63,
                            //                       height: 20,
                            //                       decoration: BoxDecoration(
                            //                           color: Colors.transparent
                            //                               .withOpacity(0.4),
                            //                           borderRadius:
                            //                               BorderRadius.circular(
                            //                                   10)),
                            //                       child: Center(
                            //                         child: Text(
                            //                           '30 ${S.current.rs}',
                            //                           style: TextStyle(
                            //                               color: Colors.white),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //           // Container(
                            //           //   height: 98,
                            //           //   width: 100,
                            //           //   decoration: BoxDecoration(
                            //           //       borderRadius:
                            //           //           BorderRadius.circular(10),
                            //           //       image: DecorationImage(
                            //           //           image: AssetImage(
                            //           //               'assets/icons/Rectangle 7888.png'),
                            //           //           fit: BoxFit.fill)),
                            //           // ),
                            //           separatorBuilder: (context, index) =>
                            //               const SizedBox(
                            //                 width: 5,
                            //               ),
                            //           itemCount: 10),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                context: context);
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        langKey == 'ar'
                            ? '${model.data![index].sameSubCategoryProducts![index].translations!.first.name}'
                            : '${model.data![index].sameSubCategoryProducts![index].translations!.last.name}',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          langKey == 'ar'
                              ? '${model.data![index].sameSubCategoryProducts![index].translations!.first.dis}'
                              : '${model.data![index].sameSubCategoryProducts![index].translations!.last.dis}',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              print('${index}');
                              setState(() {
                                selected = index;

                                // print(total);

                                // // total = model.priceAfterDiscount;
                                HomeCubit().postcart(
                                    productID: model.data![index]
                                        .sameSubCategoryProducts![index].id,
                                    quantity: 1);
                                showcart = true;
                                total += int.parse(model
                                    .data![index]
                                    .sameSubCategoryProducts![index]
                                    .priceAfterDiscount!);

                                // if (selected == false) {
                                //   selected = true;
                                // } else {
                                //   selected = false;
                                // }
                              });

                              // setState(() {
                              //   selected = true;
                              // });
                            },
                            child: Container(
                              width: 70,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: borderColor),
                                color: selected == index
                                    ? button1color
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                '${model.data![index].sameSubCategoryProducts![index].priceAfterDiscount} ${S.current.rs}',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: selected == index
                                        ? Colors.white
                                        : borderColor),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                              '${model.data![index].sameSubCategoryProducts![index].price}${S.current.rs}',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: textColor))
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: shopCloseColorLite,
                          //       borderRadius:
                          //           BorderRadius.circular(10)),
                          //   child: Text('aaaaaa'),
                          // ),
                          // Text('aaaaaa'),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 80,
                    width: 85,
                    child: Image.network(
                        '${domainlink}${model.data![index].sameSubCategoryProducts![index].masterImage}'),
                  ),
                )
              ],
            ),
          ));
}
