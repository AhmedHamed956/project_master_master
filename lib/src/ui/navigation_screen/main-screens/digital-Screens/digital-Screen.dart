import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:project/Models/GetDigitalData_model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Cubit.dart';

import '../../../../../generated/l10n.dart';
import '../../../Home/states.dart';
import '../../../Shared/constant.dart';
import '../../../components/appar.dart';
import '../../../components/component.dart';
import 'order-details.dart';

class DigtalScreen extends StatefulWidget {
  final String? title;
  final String? type;

  const DigtalScreen({super.key, this.title, this.type});

  @override
  State<DigtalScreen> createState() => _DigtalScreenState();
}

class _DigtalScreenState extends State<DigtalScreen> {
  FocusNode _focusNode = new FocusNode();
  FocusNode _focusNode2 = new FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _namevalidate = false;
  bool _phonevalidate = false;

  int cost = 0;
  String? totalcost;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //Add Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
    _focusNode2.addListener(_onLoginUserNameFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getDigitalGiftData(),
        child: BlocConsumer<HomeCubit, HomeAppState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ConditionalBuilder(
                  condition: HomeCubit.get(context).digitalOrderModel != null,
                  builder: (context) {
                    return orderscreen(
                        HomeCubit.get(context).digitalOrderModel!,
                        nameController,
                        phoneController);
                  },
                  fallback: ((context) => Container(
                      color: Colors.white,
                      child: const Center(
                          child: CircularProgressIndicator(
                              color: button2color)))));
            }));
  }

  Widget orderscreen(
          DigitalOrderModel model,
          TextEditingController nameController,
          TextEditingController phoneController) =>
      Scaffold(
          appBar: DigitalAppBarWidget(
              label: widget.title != null
                  ? widget.title.toString()
                  : S.current.digital_gifts,
              type: widget.type),
          backgroundColor: mainBackgourndColor,
          body: Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.only(right: 11, left: 12, top: 16),
                  child: ListView.separated(
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => digitalItem(
                          model.data![index],
                          nameController,
                          phoneController,
                          index),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 21),
                      itemCount: model.data!.length))));

  Widget digitalItem(
          DigitalOrderData model,
          TextEditingController nameController,
          TextEditingController phoneController,
          int index) =>
      InkWell(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: Colors.white,
                builder: (BuildContext context) {
                  return _bottomWidget(model, index);
                },
                context: context);
          },
          child: Container(
              width: 405,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: buttonLightcolor)),
              child: Column(children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 133,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage("$domainlink${model.image}"),
                            fit: BoxFit.fill))),
                const SizedBox(height: 18),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(model.name.toString(),
                              style: const TextStyle(
                                  color: textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                          Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: GradientIcon(
                                  Icons.info,
                                  20.0,
                                  const LinearGradient(
                                      colors: <Color>[
                                        button1color,
                                        button2color
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight)))
                        ])),
                const SizedBox(height: 10)
              ])));

  Widget _bottomWidget(DigitalOrderData model, int index) {
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        // color: Colors.grey,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage("${domainlink}${model.image}"),
                        ),
                      ),
                      // child:
                      //     Image.asset('assets/icons/Rectangle 7863-2 2.png'),
                    ),
                    // Container(
                    //     height: 180,
                    //     width: MediaQuery.of(context).size.width,
                    //     clipBehavior: Clip.hardEdge,
                    //     decoration: const BoxDecoration(
                    //         borderRadius: BorderRadius.only(
                    //             topLeft: Radius.circular(10),
                    //             topRight: Radius.circular(10))),
                    //     child: ImagePixels.container(
                    //         imageProvider:
                    //             NetworkImage("$domainlink${model.image}"),
                    //         colorAlignment: Alignment.topLeft,
                    //         defaultColor: Colors.grey,
                    //         child: Image.network("$domainlink${model.image}"))),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 25, left: 23, right: 23),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${model.name}',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: textColor)),
                              totalcost == null
                                  ? Text(
                                      '${model.prices![index]} ${S.current.rs}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: indicatorColor),
                                    )
                                  : Text(
                                      '${totalcost} ${S.current.rs}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: indicatorColor),
                                    ),
                            ])),
                    const SizedBox(height: 9),
                    Padding(
                        padding: const EdgeInsets.only(left: 23, right: 23),
                        child: SizedBox(
                            width: 377,
                            child: Text("${model.dis}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: textColor)))),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            //  / shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        cost = index;
                                        totalcost = model.prices![index];
                                        print(totalcost.toString());
                                      });
                                    },
                                    child: cost == index
                                        ? Container(
                                            height: 24,
                                            width: 75,
                                            decoration: BoxDecoration(
                                                color: button1color,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: button1color)),
                                            child: Center(
                                              child: Text(
                                                '${model.prices![index]} ${S.current.rs}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 24,
                                            width: 75,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: button1color)),
                                            child: Center(
                                              child: Text(
                                                '${model.prices![index]} ${S.current.rs}',
                                                style: TextStyle(
                                                    color: button1color,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ))),
                            separatorBuilder: (context, index) =>
                                const SizedBox(),
                            itemCount: model.prices!.length),
                      ),
                    ),
                    // Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 8),
                    //     child: SizedBox(
                    //         height: 30,
                    //         width: MediaQuery.of(context).size.width,
                    //         child: ListView.separated(
                    //             scrollDirection: Axis.horizontal,
                    //             //  / shrinkWrap: true,
                    //             itemBuilder: (context, index) =>
                    //                 priceWidget(model, index),
                    //             separatorBuilder: (context, index) =>
                    //                 const SizedBox(),
                    //             itemCount: model.prices!.length))),
                    const SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.only(left: 13, right: 16),
                        child: Container(
                            width: 405,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: buttonLightcolor, width: 1)),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 23, right: 22, top: 15, bottom: 20),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 6, 0, 0),
                                            child: SizedBox(
                                                width: 360,
                                                child: TextField(
                                                    keyboardType:
                                                        TextInputType.text,
                                                    controller: nameController,
                                                    style: const TextStyle(
                                                        color: textColor),
                                                    maxLines: 2,
                                                    decoration: InputDecoration(
                                                        errorText: _namevalidate
                                                            ? langKey == 'ar'
                                                                ? 'برجاء ادخال اسم المتلقي'
                                                                : 'Please Enter receiver name'
                                                            : null,
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            126,
                                                                            132,
                                                                            138,
                                                                            1))),
                                                        border: const OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor,
                                                                width: 0.0))),
                                                    focusNode: _focusNode))),
                                        Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 7),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7),
                                            color: Colors.white,
                                            child: Text(S.current.receiver_name,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: _focusNode.hasFocus
                                                        ? textfieldLabelcolor
                                                        : textfieldLabelcolor)))
                                      ]),
                                      const SizedBox(height: 20),
                                      Stack(children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 6, 0, 0),
                                            child: SizedBox(
                                                width: 360,
                                                child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: phoneController,
                                                    style: const TextStyle(
                                                        color: textColor),
                                                    maxLines: 2,
                                                    decoration: InputDecoration(
                                                        focusedBorder:
                                                            const OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            126,
                                                                            132,
                                                                            138,
                                                                            1))),
                                                        border: const OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    textFieldColor,
                                                                width: 0.0)),
                                                        errorText: _phonevalidate
                                                            ? langKey == 'ar'
                                                                ? 'برجاء ادخال رقم الهاتف'
                                                                : 'Please Enter Phone Number'
                                                            : null),
                                                    focusNode: _focusNode2))),
                                        Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 7),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7),
                                            color: Colors.white,
                                            // input outline default seems using 4.0 as padding from their source
                                            child: Text(S.current.phone_number,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: _focusNode2.hasFocus
                                                        ? textfieldLabelcolor
                                                        : textfieldLabelcolor)))
                                      ])
                                    ])))),
                    const SizedBox(height: 40),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 30),
                        child: SizedBox(
                            width: 378,
                            height: 56,
                            child: ingridentbutton(
                                function: () {
                                  setState(() {
                                    nameController.text.isEmpty
                                        ? _namevalidate = true
                                        : _namevalidate = false;

                                    phoneController.text.isEmpty
                                        ? _phonevalidate = true
                                        : _phonevalidate = false;
                                  });
                                  if (nameController.text.isNotEmpty &&
                                      phoneController.text.isNotEmpty) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DigtalOrders(
                                                productID: model.id.toString(),
                                                price: totalcost ?? "",
                                                namecontroller: nameController,
                                                phonecontroller:
                                                    phoneController)));
                                  }
                                },
                                color1: button1color,
                                color2: button2color,
                                text: S.current.send_a_gift)))
                  ])));
    });
  }

  Widget priceWidget(model, index) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: InkWell(
            onTap: () {
              setState(() {
                cost = index;
                totalcost = model.prices![index];
                log(totalcost.toString());
              });
            },
            child: cost == index
                ? Container(
                    height: 24,
                    width: 75,
                    decoration: BoxDecoration(
                        color: button1color,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: button1color)),
                    child: Center(
                        child: Text('${model.prices![index]} ${S.current.rs}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))))
                : Container(
                    height: 24,
                    width: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: button1color)),
                    child: Center(
                        child: Text('${model.prices![index]} ${S.current.rs}',
                            style: const TextStyle(
                                color: button1color,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))))));
  }

  @override
  void dispose() {
    //Dispose Listener to know when is updated focus
    _focusNode.addListener(_onLoginUserNameFocusChange);
    _focusNode2.addListener(_onLoginUserNameFocusChange);

    super.dispose();
  }

  void _onLoginUserNameFocusChange() {
    //Force updated once if focus changed
    // setState(() {});
  }
}
