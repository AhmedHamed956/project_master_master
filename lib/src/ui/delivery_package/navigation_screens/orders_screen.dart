import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/src/common/route_argument.dart';
import 'package:project/src/ui/delivery_package/cubits/tracking/tracking_cubit.dart';
import 'package:project/src/ui/delivery_package/data/model/tracking/order_status_model.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/screens/chat_cycle.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Shared/constant.dart';

class DeliveryOrdersScreen extends StatefulWidget {
  const DeliveryOrdersScreen({super.key});

  @override
  State<DeliveryOrdersScreen> createState() => _DeliveryOrdersScreenState();
}

class _DeliveryOrdersScreenState extends State<DeliveryOrdersScreen> {
  final Shader linearGradient =
      const LinearGradient(colors: <Color>[button2color, button1color])
          .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  int _index = 0;

  // AcceptOrderModel? _trackingBloc.orderModel;

  bool _orderNumberTrue = false,
      _receiveOrder = false,
      _yesOrder = false,
      _receiveMoney = false;
  late TrackingCubit _trackingBloc;

  OrderStatusModel? _orderStatusModel = OrderStatusModel();

  double _rating = 0.0;

  @override
  void initState() {
    _trackingBloc = BlocProvider.of<TrackingCubit>(context);
    // if(){
    // }
    _trackingBloc.getTrackingOrder();

    // _trackingBloc.orderModel = AcceptOrderModel(orderNumber: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<TrackingCubit, TrackingState>(
            listener: (BuildContext context, state) {
              if (state is TrackingOrderSuccess) {
                print("TrackingOrderSuccess : ${state.response.toJson()}");
                _orderStatusModel = OrderStatusModel();
                // _trackingBloc.orderModel = state.response.data;
                // _orderStatusModel!.orderId =
                // state.response.data!.orderNumber.toString();
                _index = 0;
                setState(() {});
              }

              if (state is RateOrderSuccess) {
                log("RateOrderSuccess");

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Your rate send Successfuly')));
                _orderStatusModel!.isRatingShop = 1;
                _trackingBloc.saveSteps(model: _orderStatusModel!);
              }
              if (state is SaveStepsSuccess) {
                if (state.response.data!.isDone == 1) {
                  _orderStatusModel = null;
                  _rating = 0;
                  _trackingBloc.closeOrder(true);
                  _index = 0;
                } else if (state.response.data!.isPayed == 1) {
                  _index = 6;
                } else if (state.response.data!.isClientDelivery == 1) {
                  _index = 5;
                } else if (state.response.data!.isRedirectClient == 1) {
                  _index = 4;
                } else if (state.response.data!.isRatingShop == 1) {
                  _index = 3;
                  _trackingBloc.goToClient();
                } else if (state.response.data!.isRedirectShop == 1) {
                  _index = 2;
                } else if (state.response.data!.isWhatsApp == 1) {
                  _index = 1;
                  _trackingBloc.goToMarket();
                }
                setState(() {});
              }
            },
            child: SingleChildScrollView(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                    child: Column(children: [
                      _index >= 0
                          ? IntrinsicHeight(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Column(children: [
                                    IconButton(
                                        onPressed: () {},
                                        // => setState(() =>
                                        //     _index <= 0 ? _index = 0 : null),
                                        icon: Container(
                                            height: 17,
                                            width: 17,
                                            decoration: BoxDecoration(
                                                gradient: quickButton,
                                                shape: BoxShape.circle))),
                                    const Expanded(
                                        child:
                                            VerticalDivider(color: Colors.grey))
                                  ]),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 8),
                                        Text('WhatsApp تواصل مع المرسل عبر',
                                            style: TextStyle(
                                              foreground: Paint()
                                                ..shader = linearGradient,
                                              fontSize: 16,
                                            )),
                                        const Text(
                                            "WhatsApp  انقر فوق علامة للاتصال بالمرسل",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: textColor)),
                                        const SizedBox(height: 10),
                                        InkWell(
                                            onTap: _goToWhatsApp,
                                            child: Container(
                                                width: 70,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: whatsAppColor),
                                                child: Center(
                                                    child: SvgPicture.asset(
                                                        'assets/icons/home/whatsApp_ic.svg',
                                                        color: Colors.green))))
                                      ])
                                ]))
                          : const SizedBox(),
                      IntrinsicHeight(
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Column(mainAxisSize: MainAxisSize.min, children: [
                              IconButton(
                                  onPressed: () {},
                                  // => setState(
                                  //     () => _index <= 1 ? _index = 1 : null),
                                  icon: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          gradient: _index >= 1
                                              ? quickButton
                                              : trackPointButton,
                                          shape: BoxShape.circle))),
                              Expanded(
                                  child: SizedBox(
                                      height: _index >= 1 ? null : 20,
                                      child: const VerticalDivider(
                                          color: Colors.grey)))
                            ]),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  const SizedBox(height: 8),
                                  Text('توجه إلى المتجر',
                                      style: TextStyle(
                                          fontSize: 16,
                                          foreground: Paint()
                                            ..shader = linearGradient)),
                                  _index >= 1
                                      ? Row(children: [
                                          Text(
                                              " #${_trackingBloc.orderModel?.orderNumber} رقم الطلب ",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: textColor)),
                                          Flexible(
                                              fit: FlexFit.loose,
                                              child: CheckboxListTile(
                                                  dense: true,
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  title: const Text(
                                                      "رقم الطلب الصحيح"),
                                                  value: _orderNumberTrue,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _orderNumberTrue =
                                                          newValue!;
                                                    });
                                                  },
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing))
                                        ])
                                      : const SizedBox(),
                                  _index >= 1
                                      ? Row(children: [
                                          const Text("تفاصيل الطلب",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: textColor)),
                                          Flexible(
                                              fit: FlexFit.loose,
                                              child: CheckboxListTile(
                                                  dense: true,
                                                  visualDensity:
                                                      VisualDensity.comfortable,
                                                  title: const Text(
                                                      "إستقبال الأوامر"),
                                                  value: _receiveOrder,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      _receiveOrder = newValue!;
                                                    });
                                                  },
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing))
                                        ])
                                      : const SizedBox(),
                                  _index >= 1
                                      ? Row(children: const [
                                          Text("رقم اسم المنتج",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: textColor))
                                        ])
                                      : const SizedBox()
                                ]))
                          ])),
                      IntrinsicHeight(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Column(children: [
                              IconButton(
                                  onPressed: () {},
                                  // onPressed: () => setState(
                                  //     () => _index <= 2 ? _index = 2 : null),
                                  icon: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          gradient: _index >= 2
                                              ? quickButton
                                              : trackPointButton,
                                          shape: BoxShape.circle))),
                              Expanded(
                                  child: SizedBox(
                                      height: _index >= 2 ? null : 20,
                                      child: const VerticalDivider(
                                          color: Colors.grey)))
                            ]),
                            Column(children: [
                              const SizedBox(height: 8),
                              Text('تصنيف المتجر',
                                  style: TextStyle(
                                      foreground: Paint()
                                        ..shader = linearGradient,
                                      fontSize: 16)),
                              const SizedBox(height: 10),
                              _index >= 2
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: RatingBar(
                                          itemSize: 18,
                                          initialRating: 0,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          ratingWidget: RatingWidget(
                                              full: const Icon(Icons.star,
                                                  color: rateColor),
                                              half: const Icon(Icons.star_half,
                                                  color: rateColor),
                                              empty: const Icon(
                                                  Icons.star_border,
                                                  color: rateColor)),
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                          onRatingUpdate: (rating) {
                                            _rating = rating;
                                            log(rating.toString());
                                          }))
                                  : const SizedBox()
                            ])
                          ])),
                      IntrinsicHeight(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Column(children: [
                              IconButton(
                                  onPressed: () {},
                                  // onPressed: () => setState(
                                  //     () => _index <= 3 ? _index = 3 : null),
                                  icon: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          gradient: _index >= 3
                                              ? quickButton
                                              : trackPointButton,
                                          shape: BoxShape.circle))),
                              Expanded(
                                  child: SizedBox(
                                      height: _index >= 3 ? null : 20,
                                      child: const VerticalDivider(
                                          color: Colors.grey)))
                            ]),
                            Column(children: [
                              const SizedBox(height: 8),
                              Text('اذهب إلى العميل',
                                  style: TextStyle(
                                      foreground: Paint()
                                        ..shader = linearGradient,
                                      fontSize: 16)),
                              const SizedBox(height: 10),
                              _index >= 3
                                  ? Row(children: [
                                      InkWell(
                                          onTap: _callClient,
                                          child: Container(
                                              width: 70,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: whatsAppColor),
                                              child: Center(
                                                  child: Container(
                                                      height: 48,
                                                      width: 48,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          gradient:
                                                              quickButton),
                                                      child: const Center(
                                                          child: Icon(
                                                              Icons.call,
                                                              color: Colors
                                                                  .white))))))
                                    ])
                                  : const SizedBox()
                            ])
                          ])),
                      IntrinsicHeight(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Column(children: [
                              IconButton(
                                  onPressed: () {},
                                  // onPressed: () => setState(
                                  //     () => _index <= 4 ? _index = 4 : null),
                                  icon: Container(
                                      height: 17,
                                      width: 17,
                                      decoration: BoxDecoration(
                                          gradient: _index >= 4
                                              ? quickButton
                                              : trackPointButton,
                                          shape: BoxShape.circle))),
                              Expanded(
                                  child: SizedBox(
                                      height: _index >= 4 ? null : 20,
                                      child: const VerticalDivider(
                                          color: Colors.grey)))
                            ]),
                            Flexible(
                                fit: FlexFit.loose,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Text('تسليم للعميل',
                                          style: TextStyle(
                                            foreground: Paint()
                                              ..shader = linearGradient,
                                            fontSize: 16,
                                          )),
                                      _index >= 4
                                          ? CheckboxListTile(
                                              dense: true,
                                              visualDensity:
                                                  const VisualDensity(
                                                      horizontal: VisualDensity
                                                          .minimumDensity),
                                              title: const Text("أجل تسليم"),
                                              value: _yesOrder,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _yesOrder = newValue!;
                                                });
                                              },
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing)
                                          : const SizedBox()
                                    ]))
                          ])),
                      IntrinsicHeight(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            IconButton(
                                onPressed: () {},
                                // onPressed: () => setState(
                                //     () => _index <= 5 ? _index = 5 : null),
                                icon: Container(
                                    height: 17,
                                    width: 17,
                                    decoration: BoxDecoration(
                                        gradient: _index >= 5
                                            ? quickButton
                                            : trackPointButton,
                                        shape: BoxShape.circle))),
                            Flexible(
                                fit: FlexFit.loose,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Text('يستلم الراتب',
                                          style: TextStyle(
                                              foreground: Paint()
                                                ..shader = linearGradient,
                                              fontSize: 16)),
                                      _index >= 5
                                          ? CheckboxListTile(
                                              dense: true,
                                              visualDensity:
                                                  const VisualDensity(
                                                      horizontal: VisualDensity
                                                          .minimumDensity),
                                              title: const Text(
                                                  "تم استلام الدفعة"),
                                              value: _receiveMoney,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _receiveMoney = newValue!;
                                                });
                                              },
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing)
                                          : const SizedBox()
                                    ]))
                          ])),
                      const SizedBox(height: 60),
                      InkWell(
                          onTap: _onButtonTap,
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  gradient: quickButton),
                              child: Center(
                                  child: Text(_switchButton(),
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white)))))
                    ])))));
  }

  String _switchButton() {
    String label = "تواصل مع المتلقي";
    switch (_index) {
      case 0:
        label = "تواصل مع المتلقي";
        break;
      case 1:
        label = "اذهب إلى المتجر";
        break;
      case 2:
        label = "تم استلام الطلب";
        break;
      case 3:
        label = "توجه للعميل";
        break;
      case 4:
        label = "تم التسليم للعميل";
        break;
      case 5:
        label = "تم استلام الدفعة";
        break;
      case 6:
        label = "إغلاق الطلب";
        break;
      default:
        "";
    }

    return label;
  }

  void _onButtonTap() {
    _orderStatusModel!.orderId =
        _trackingBloc.orderModel?.orderNumber.toString();
    if (_orderStatusModel?.orderId != null) {
      switch (_index) {
        case 0:
          _orderStatusModel!.isWhatsApp = 1;
          _trackingBloc.saveSteps(model: _orderStatusModel!);
          break;
        case 1:
          _orderStatusModel!.isRedirectShop = 1;
          _trackingBloc.saveSteps(model: _orderStatusModel!);
          break;
        case 2:
          if (_rating > 0) {
            _trackingBloc.rateOrder(
                rate: _rating, orderId: _trackingBloc.orderModel!.orderNumber!);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chose rate first')));
          }
          break;
        case 3:
          _orderStatusModel!.isRedirectClient = 1;
          _trackingBloc.saveSteps(model: _orderStatusModel!);
          break;
        case 4:
          _orderStatusModel!.isClientDelivery = 1;
          _trackingBloc.saveSteps(model: _orderStatusModel!);
          break;
        case 5:
          _orderStatusModel!.isPayed = 1;
          _trackingBloc.saveSteps(model: _orderStatusModel!);
          break;
        case 6:
          _orderStatusModel!.isDone = 1;
          _trackingBloc.saveSteps(model: _orderStatusModel!);
          break;
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Order id not found')));
    }
    print("index : $_index");
  }

  Future<void> _goToWhatsApp() async {
    if (_trackingBloc.orderModel != null &&
            _trackingBloc.orderModel!.whatsApp != null
        // && _trackingBloc.orderModel!.typeSend == "ToPersone"
        ) {
      List<String> data = [
        _trackingBloc.orderModel!.clientId!,
        "رسالة جديدة من مندوب التوصيل",
        _trackingBloc.orderModel!.clientFcmToken ?? ""
      ];
      log("dataaaaaaa  $data");

      Navigator.pushNamed(context, ChatCycle.routeName,
          arguments: RouteArgument(param: data));
    }
  }

  Future<void> _callClient() async {
    if (_trackingBloc.orderModel != null &&
        _trackingBloc.orderModel!.whatsApp != null) {
      await canLaunchUrl(Uri.parse("tel:${_trackingBloc.orderModel!.whatsApp}"))
          ? launchUrl(Uri.parse("tel:${_trackingBloc.orderModel!.whatsApp}"))
          : log("cannot launch");
    }
  }
}
