import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:project/Models/Tabs_Details_Model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/navigation_screen/main-screens/quick-screen.dart';
import 'package:project/src/ui/widgets/card-widget.dart';
import 'package:project/test.dart';

import '../../../Models/model/product_data.dart';
import '../../../Models/model/shop_model.dart';
import '../../../Models/shop_details_Model.dart';
import '../../../generated/l10n.dart';
import '../Cart_Shops/Add_To_Cart.dart';
import '../Home/Cubit.dart';
import '../Home/states.dart';
import '../components/component.dart';

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
  late TabController _tabController = TabController(length: 1, vsync: this);

  // final date = DateTime.now();

  dynamic tdata = DateFormat("HH:mm:ss").format(DateTime.now());
  int? selected;
  DateTime _currentDate2 = DateTime.now();
  String aaaa = DateFormat.yMd().format(DateTime.now());

  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();
  TextEditingController hoursController = TextEditingController();
  TextEditingController minController = TextEditingController();
  String? time;
  bool? am;
  bool? pm;
  late HomeCubit _homeCubit;

  // var total;
  void initState() {
    hoursController.text = '01';
    minController.text = '00';
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit
      ..shopDetails(id: widget.id)
      ..tabdetails(id: widget.id)
      ..getCartData(id: widget.id);
    am = true;
    // selected = null;
    print(langKey);
    print('$tdata');
    // HomeCubit.get(context).shopDetails(id: widget.id);
    print(widget.id);
    super.initState();
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Test()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    print('result is $result');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeAppState>(
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
        if (state is PostOrderSuccessStates) {}
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
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: button2color,
                    ),
                  ),
                ));
      },
    );
  }

  Widget shopDetailScreen(
          ShopDetailsModel model, TabsDetailsModel tabmodel, String id) =>
      Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Column(children: [
              Stack(children: [
                Container(
                  height: 221,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              '$domainlink${model.data!.background}'),
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
                              height: 40, width: 40, 'assets/icons/search.png')
                        ]))
              ]),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      height: 70,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Container(
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  '$domainlink${model.data!.logo}'),
                                              fit: BoxFit.fill)))),
                              const SizedBox(width: 3),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ConstrainedBox(
                                        constraints:
                                            const BoxConstraints(maxWidth: 200),
                                        child: Text(
                                            model.data!.storeName.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: textColor))),
                                    Text(
                                      langKey == 'ar'
                                          ? model.data!.categoryData!
                                              .translations![0].name
                                              .toString()
                                          : model.data!.categoryData!
                                              .translations![1].name
                                              .toString(),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: textColor),
                                    ),
                                    Row(children: [
                                      // const Text('(4.8)',
                                      //     style: TextStyle(
                                      //         color: textColor,
                                      //         fontSize: 14,
                                      //         fontWeight: FontWeight.w400)),
                                      RatingBarIndicator(
                                          rating:
                                              model.data!.ratings!.isNotEmpty
                                                  ? model.data!.ratings?.first
                                                          .averageRating ??
                                                      0.0
                                                  : 0.0,
                                          // double.tryParse(model.commissionRate ?? '0.0') ??
                                          //     0.0,
                                          unratedColor: Colors.grey.shade300,
                                          itemCount: 5,
                                          itemSize: 14,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return const Icon(Icons.star,
                                                color: Colors.amber);
                                          }),
                                    ])
                                  ])
                            ]),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 12),
                                child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Container(
                                            width: 63,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: shopCloseColorLite,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                                child: Text(S.current.closed,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600))))
                                      ])
                                    ]))
                          ]))),

              // width: 200,

              SizedBox(
                  width: 386,
                  height: 45,
                  child: Column(children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(color: Colors.grey)),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(children: [
                                SvgPicture.asset(
                                    'assets/icons/home/location_ic.svg'),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text('1.2  ${S.current.km} ',
                                    style: const TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ]),
                              const SizedBox(
                                  height: 25,
                                  child: VerticalDivider(color: Colors.grey)),
                              Row(children: [
                                SvgPicture.asset(
                                    'assets/icons/home/Vector-9.svg'),
                                const SizedBox(width: 8),
                                Text(
                                    '${model.data!.deliveryTime} ${S.current.min}.',
                                    style: const TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ]),
                              const SizedBox(
                                  height: 25,
                                  child: VerticalDivider(color: Colors.grey)),
                              Row(children: [
                                Image.asset('assets/icons/Group.png'),
                                const SizedBox(width: 8),
                                Text(
                                    '${model.data!.deliveryCost} ${S.current.rs} ',
                                    style: const TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))
                              ])
                              // VerticalDivider(
                              //   color: Colors.grey,
                              //   // thickness: 1,
                              // ),
                            ]))
                  ])),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(color: Colors.grey)),
              ConditionalBuilder(
                  builder: (context) {
                    return _tabSection(
                        model.data!.storeName.toString(),
                        context,
                        HomeCubit.get(context).shopDetailsModel!.data!,
                        tabmodel,
                        HomeCubit.get(context).tabsDetailsModel!.data!.first);
                  },
                  fallback: (context) {
                    return const Center(
                        child: CircularProgressIndicator(color: button2color));
                  },
                  condition: State is! TabDetailsLoadingState)
            ])),
            total != 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          print('aaaa');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  // AddToCart(id: model.data!.id)
                                  CardWidget(shopId: model.data!.id!)));
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
                                    child: Text(S.current.show_cart,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700))),
                                const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: VerticalDivider(
                                        color: Colors.white, thickness: 1)),
                                Text(
                                  '${S.current.total} $total ${S.current.rs}',
                                  style: const TextStyle(
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

  Widget _tabSection(String storename, BuildContext context, ShopData model,
      TabsDetailsModel tabmodel, Data products) {
    return DefaultTabController(
        length: tabmodel.data!.length,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
              height: 30,
              child: Row(children: [
                const SizedBox(width: 24),
                Image.asset('assets/icons/system-uicons_filtering.png'),
                Expanded(
                    child: Stack(children: [
                  TabBar(
                      indicatorColor: indicatorColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: purpleColor,
                      unselectedLabelColor: textColor,
                      isScrollable: true,
                      onTap: _onTabTap,
                      controller: _tabController,
                      labelStyle: const TextStyle(fontSize: 16),
                      unselectedLabelStyle: const TextStyle(fontSize: 16),
                      tabs: [
                        for (int i = 0; i < tabmodel.data!.length; i++)
                          Tab(
                              child: Text(
                                  langKey == 'ar'
                                      ? "${tabmodel.data![i].translations!.first.name}"
                                      : "${tabmodel.data![i].translations!.last.name}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)))
                      ]),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                      child: Divider(color: Colors.grey))
                ]))
              ])),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (int i = 0; i < tabmodel.data!.length; i++)
                      ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) => flower(
                              tabmodel.data![i].sameSubCategoryProducts![index],
                              index,
                              storename),
                          separatorBuilder: (context, index) => const SizedBox(
                              height: 30, child: Divider(color: Colors.grey)),
                          itemCount:
                              tabmodel.data![i].sameSubCategoryProducts!.length)
                  ]))
        ]));
  }

  void _onTabTap(int value) {
    _tabController.animateTo(value);
  }

  Widget flower(SameSubCategoryProducts product, int index, String storename) {
    return InkWell(
        onTap: () {
          showModalBottomSheet<void>(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return productDetailsView(product, storename);
              });
        },
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
                          ? '${product.translations!.first.name}'
                          : '${product.translations!.last.name}',
                      style: const TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(height: 15),
                  ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Text(
                          langKey == 'ar'
                              ? '${product.translations!.first.dis}'
                              : '${product.translations!.last.dis}',
                          style: const TextStyle(
                              color: textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400))),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            print('$index');
                            setState(() {
                              selected = index;

                              // print(total);

                              // // total = model.priceAfterDiscount;
                              HomeCubit().postcart(
                                  productID: product.id,
                                  quantity: 1,
                                  scheduler: '',
                                  time: '');
                              showcart = true;
                              total += int.parse(product.priceAfterDiscount!);
                            });
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
                                      '${product.priceAfterDiscount} ${S.current.rs}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: selected == index
                                              ? Colors.white
                                              : borderColor))))),
                      const SizedBox(width: 10),
                      Text('${product.price}${S.current.rs}',
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: textColor))
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
                child: Image.network('$domainlink${product.masterImage}'),
              ),
            )
          ],
        ));
  }

  Widget productDetailsView(SameSubCategoryProducts product, String storename) {
    return BlocProvider(
        create: (context) =>
            HomeCubit()..getSuggestionHomeShop(id: product.id.toString()),
        child: BlocConsumer<HomeCubit, HomeAppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return FractionallySizedBox(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
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
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.grey,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "$domainlink${product.masterImage}"),
                          ),
                        ),
                        // child:
                        //     Image.asset('assets/icons/Rectangle 7863-2 2.png'),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 23, right: 23),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  product.name.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: textColor),
                                  // maxLines: 1,
                                )),
                                Text(
                                  '${product.priceAfterDiscount} ${S.current.rs}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: indicatorColor),
                                ),
                              ])),
                      Padding(
                          padding: const EdgeInsets.only(left: 30, right: 23),
                          child: Row(children: [
                            Text('${product.price} ${S.current.rs}',
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                    color: textColor))
                          ])),
                      const SizedBox(height: 9),
                      Padding(
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        child: SizedBox(
                          height: 50,
                          width: 377,
                          child: Text(
                            '${product.dis}',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: textColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            product.productQuick != null
                                ? InkWell(
                                    onTap: () {
                                      Navigator.pushReplacement<void, void>(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              QuickScreen(
                                            quickmodel: product.productQuick,
                                            isQuick: 'true',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
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
                                  )
                                : Container(),
                            const SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: () {
                                final calendarCarouselNoHeader =
                                    CalendarCarousel<Event>(
                                  // todayBorderColor: Colors.green,
                                  onDayPressed: (date, events) {
                                    this.setState(() => _currentDate2 = date);
                                    events
                                        .forEach((event) => print(event.title));

                                    print(date);
                                  },
                                  showOnlyCurrentMonthDate: true,
                                  selectedDayTextStyle: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                  selectedDayButtonColor: Colors.transparent,
                                  weekendTextStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  thisMonthDayBorderColor: Colors.grey,

                                  weekFormat: false,
                                  todayButtonColor:
                                      Colors.blue.withOpacity(0.5),
                                  height: 420.0,
                                  selectedDateTime: _currentDate2,
                                  targetDateTime: _targetDateTime,
                                  customGridViewPhysics:
                                      NeverScrollableScrollPhysics(),
                                  markedDateCustomShapeBorder: CircleBorder(
                                      side: BorderSide(color: Colors.yellow)),

                                  showHeader: false,

                                  // minSelectedDate: _currentDate.subtract(Duration(days: 360)),
                                  // maxSelectedDate: _currentDate.add(Duration(days: 360)),
                                  prevDaysTextStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  // inactiveDaysTextStyle: TextStyle(
                                  //   color: Colors.tealAccent,
                                  //   fontSize: 16,
                                  // ),
                                  onCalendarChanged: (DateTime date) {
                                    this.setState(() {
                                      _targetDateTime = date;
                                      _currentMonth = DateFormat.yMMM()
                                          .format(_targetDateTime);
                                    });
                                  },
                                );
                                // _navigateAndDisplaySelection(context);
                                showModalBottomSheet<void>(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    // backgroundColor: Colors.transparent,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (BuildContext context,
                                                setState) =>
                                            FractionallySizedBox(
                                                heightFactor: 0.7,
                                                child: Test()),
                                      );
                                    },
                                    context: context);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [button2color, button1color])),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                      const SizedBox(height: 21),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: lighttextColor, width: 1)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text(storename,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400))),
                                Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text(
                                        '(4.8)',
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(width: 9),
                                      RatingBarIndicator(
                                          rating: 4.0,
                                          unratedColor: Colors.grey,
                                          itemCount: 5,
                                          itemSize: 12,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return const Icon(Icons.star,
                                                color: Colors.amber);
                                          }),
                                    ])
                              ])),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 28, right: 34),
                        child: InkWell(
                          onTap: () {
                            HomeCubit()
                                .postcart(
                                    productID: product.id,
                                    quantity: 1,
                                    scheduler: scheduled,
                                    time: am_pm)
                                .then((value) => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            // AddToCart(id: product.shopId)
                                        CardWidget(shopId: product.shopId!)
                                    )));

                            print('scaaaaaaaaaaaaaaaaaaaaaaader');

                            print(scheduled);
                            print(am_pm);
                          },
                          child: Container(
                              height: 45,
                              width: 366,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [button2color, button1color])),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
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
                                      '${product.priceAfterDiscount} ${S.current.rs}',
                                      style: const TextStyle(
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
                      Divider(
                        color: dividerColor,
                        thickness: 1.5,
                      ),
                      Text(
                        S.current.similar_items,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                      Divider(
                        color: dividerColor,
                        thickness: 1.5,
                      ),
                      ConditionalBuilder(
                        condition:
                            HomeCubit.get(context).suggestionHomeProductModel !=
                                null,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 5, left: 6, bottom: 5),
                            child: Container(
                                height: 100,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 98,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  '${domainlink}${HomeCubit.get(context).suggestionHomeProductModel?.data![index].masterImage}',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 4, left: 30),
                                                child: Container(
                                                  // width: 63,
                                                  // height: 20,
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${HomeCubit.get(context).suggestionHomeProductModel?.data![index].priceAfterDiscount} ${S.current.rs}',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 12,
                                        ),
                                    itemCount: HomeCubit.get(context)
                                        .suggestionHomeProductModel!
                                        .data!
                                        .length)),
                          );
                        },
                        fallback: (context) => Container(
                          color: Colors.white,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: button2color,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
