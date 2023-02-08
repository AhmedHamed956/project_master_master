import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/GetCartData_Model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Cart_Shops/Add_To_Cart.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import '../../../Models/model/cart_data.dart';
import '../../../Models/model/products_data.dart';
import '../../../generated/l10n.dart';
import '../Cart_Shops/order-details.dart';
import '../Shared/constant.dart';
import '../components/component.dart';

class CardWidget extends StatefulWidget {
  CartData model;
  CardWidget({super.key, required this.model});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int? counter;
  List<int> _counter = [];

  //  widget.model.products!.first.quantity!.toInt();
  late int? totalcart = widget.model.total;
  late int totalprice = widget.model.totalPrice!.toInt();
  late int? price;

  late int quantity;
  @override
  // void _increment(int amount) {
  //   setState(() {
  //     counter == null ? counter = amount : null;
  //     counter = (counter! + 1);

  //     print(counter);
  //   });
  // }

  // void _dicrement(int amount) {
  //   setState(() {
  //     counter == null ? counter = amount : null;
  //     counter = (counter! - 1);

  //     print(counter);
  //   });
  // }

  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: Offset(0, -4), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                // width: 360,
                height: totalcart != 0
                    ? MediaQuery.of(context).size.height / 3
                    : MediaQuery.of(context).size.height - 100,
                child: totalcart != 0
                    ? ConditionalBuilder(
                        condition: state is! GetCartLoadingState,
                        builder: (context) {
                          return ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              quantity = widget.model.products![index].quantity!
                                  .toInt();
                              return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 28, right: 25, left: 22, bottom: 22),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      showDialog<void>(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            content: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const Text(
                                                                  'هل تريد مسح العنصر من السلة',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color:
                                                                          textColor),
                                                                ),
                                                              ],
                                                            ),
                                                            // content: const Text(
                                                            //     'A dialog is a type of modal window that\n'
                                                            //     'appears in front of app content to\n'
                                                            //     'provide critical information, or prompt\n'
                                                            //     'for a decision to be made.'),
                                                            actions: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    InkWell(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            "نعم",
                                                                            style:
                                                                                TextStyle(color: button2color),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        HomeCubit().deleteCartOrder(
                                                                            id: widget.model.products![index].id,
                                                                            shopID: widget.model.shopId);
                                                                        setState(
                                                                            () {
                                                                          totalcart =
                                                                              (totalcart! - (widget.model.products![index].quantity!.toInt() * int.parse(widget.model.products![index].productsData!.priceAfterDiscount.toString())));
                                                                          widget
                                                                              .model
                                                                              .products!
                                                                              .removeAt(index);
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            "لا",
                                                                            style:
                                                                                TextStyle(color: button2color),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 24,
                                                      height: 23,
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/icons/delete-empty.png'),
                                                              fit:
                                                                  BoxFit.fill)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Container(
                                                    width: 25.31,
                                                    height: 25,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/icons/Vector-8.png'),
                                                            fit: BoxFit.fill)),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  child: Text(
                                                '${widget.model.products![index].productsData!.priceAfterDiscount} ${S.current.rs}',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: textColor),
                                              ))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  langKey == 'ar'
                                                      ? Text(
                                                          '${widget.model.products![index].productsData!.translations!.first.name}',
                                                          style: TextStyle(
                                                            color: textColor,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        )
                                                      : Text(
                                                          '${widget.model.products![index].productsData!.translations!.last.name}',
                                                          style: TextStyle(
                                                            color: textColor,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            print(counter);
                                                            counter == 0
                                                                ? HomeCubit().deleteCartOrder(
                                                                    id: widget
                                                                        .model
                                                                        .products![
                                                                            index]
                                                                        .id,
                                                                    shopID: widget
                                                                        .model
                                                                        .shopId)
                                                                // .then((value) =>
                                                                //     _dicrement())
                                                                : HomeCubit()
                                                                    .postOrder(
                                                                    productID: widget
                                                                        .model
                                                                        .products![
                                                                            index]
                                                                        .productsData!
                                                                        .id,
                                                                    quantity:
                                                                        -1,
                                                                  );
                                                            // .then((value) => _dicrement(widget
                                                            //     .model
                                                            //     .products![
                                                            //         index]
                                                            //     .quantity!
                                                            //     .toInt()));
                                                            setState(() {
                                                              price = int.parse(widget
                                                                  .model
                                                                  .products![
                                                                      index]
                                                                  .productsData!
                                                                  .priceAfterDiscount
                                                                  .toString());

                                                              totalcart =
                                                                  (totalcart! -
                                                                      price!);
                                                              totalprice =
                                                                  totalprice -
                                                                      price!;
                                                              total =
                                                                  totalcart!;
                                                            });

                                                            /////////////////////////////
                                                            // setState(() {
                                                            //   _dicrement();
                                                            // });
                                                          },
                                                          child: counter != 0
                                                              ? Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color:
                                                                          textColor,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  child:
                                                                      const Center(
                                                                          child:
                                                                              Text(
                                                                    "-",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        color:
                                                                            textColor),
                                                                  )))
                                                              : Container()),
                                                      const SizedBox(
                                                        width: 13,
                                                      ),
                                                      Text(
                                                        // counter == null
                                                        // ?
                                                        '${widget.model.products![index].quantity!.toInt()}',
                                                        // : "$counter",
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: textColor),
                                                      ),
                                                      const SizedBox(
                                                        width: 13,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          HomeCubit().postOrder(
                                                            productID: widget
                                                                .model
                                                                .products![
                                                                    index]
                                                                .productsData!
                                                                .id,
                                                            quantity: 1,
                                                          );
                                                          // .then((value) =>
                                                          //     _increment(widget
                                                          //         .model
                                                          //         .products![
                                                          //             index]
                                                          //         .quantity!
                                                          //         .toInt()));
                                                          setState(() {
                                                            counter = widget
                                                                    .model
                                                                    .products![
                                                                        index]
                                                                    .quantity!
                                                                    .toInt() +
                                                                1;
                                                            price = int.parse(widget
                                                                .model
                                                                .products![
                                                                    index]
                                                                .productsData!
                                                                .priceAfterDiscount
                                                                .toString());

                                                            totalcart =
                                                                (totalcart! +
                                                                    price!);
                                                            totalprice =
                                                                totalprice +
                                                                    price!;
                                                            total = totalcart!;
                                                          });
                                                        },
                                                        child: Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    purpleColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                              "+",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      purpleColor),
                                                            ))),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 13,
                                              ),
                                              // Container(
                                              //   width: 110,
                                              //   height: 71,
                                              //   decoration: const BoxDecoration(
                                              //     borderRadius:
                                              //         BorderRadius.all(
                                              //             Radius.circular(10)),

                                              //     // image: DecorationImage(
                                              //     //     image: AssetImage(
                                              //     //         'assets/icons/Rectangle 7863-2 2.png'),
                                              //     //     fit: BoxFit.fill)),
                                              //   ),
                                              //   child: Image.network(
                                              //     '${domainlink}${widget.model.products![index].productsData!.masterImage}',
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ));
                            },
                            itemCount: widget.model.products!.length,
                            separatorBuilder:
                                (BuildContext context, int index) => Padding(
                              padding:
                                  const EdgeInsets.only(right: 25, left: 22),
                              child: SizedBox(
                                // height: 22,
                                child: Divider(
                                  color: Colors.grey,
                                  // thickness: 1,
                                ),
                              ),
                            ),
                          );
                        },
                        fallback: (context) => CircularProgressIndicator(
                          color: button2color,
                        ),
                      )
                    : Container(
                        child: Center(
                            child: Text(
                          "السلة فارغه",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: textColor),
                        )),
                      )),
            totalcart != 0
                ? Container(
                    // height: 131,
                    color: Colors.white,
                    width: double.infinity,
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   border: Border.all(
                    //     // color: textColor,
                    //     width: 1,
                    //   ),
                    //   borderRadius: BorderRadius.circular(4.0),
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: buttonLightcolor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 21, left: 21, top: 15, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${totalcart} ${S.current.rs}',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      S.current.total_amount,
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${widget.model.deliveryCost} ${S.current.rs}',
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        GradientText(
                                          S.current.now,
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                          gradient: LinearGradient(colors: [
                                            Color(0xAFF59B81E),
                                            Color(0xAFFB0C81F),
                                          ]),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          S.current.delivery_price,
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10.99, left: 16),
                                  child: Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${totalprice} ${S.current.rs}',
                                      style: TextStyle(
                                        color: button1color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      S.current.total,
                                      style: TextStyle(
                                        color: button1color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  )
                : Container(),
            SizedBox(
              height: 10,
            ),
            ///////////////////////////// gadwala
            // Container(
            //   // height: 131,
            //   color: Colors.white,
            //   width: double.infinity,
            //   // decoration: BoxDecoration(
            //   //   color: Colors.white,
            //   //   border: Border.all(
            //   //     // color: textColor,
            //   //     width: 1,
            //   //   ),
            //   //   borderRadius: BorderRadius.circular(4.0),
            //   // ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(right: 14, left: 9),
            //     child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           border: Border.all(
            //             color: buttonLightcolor,
            //             width: 1,
            //           ),
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.only(
            //               right: 21, left: 21, top: 15, bottom: 20),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Row(
            //                 mainAxisAlignment:
            //                     MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text(
            //                     '82.00 ${S.current.rs}',
            //                     style: TextStyle(
            //                       color: textColor,
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w700,
            //                     ),
            //                   ),
            //                   Text(
            //                     S.current.total_amount,
            //                     style: TextStyle(
            //                       color: textColor,
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w400,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               Row(
            //                 mainAxisAlignment:
            //                     MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text(
            //                     '10.00 ${S.current.rs}',
            //                     style: TextStyle(
            //                       color: textColor,
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w700,
            //                     ),
            //                   ),
            //                   Row(
            //                     children: [
            //                       GradientText(
            //                         '15/04/22 - 11:30',
            //                         style: TextStyle(
            //                             fontSize: 14,
            //                             fontWeight: FontWeight.w400),
            //                         gradient: LinearGradient(colors: [
            //                           Color(0xAFF59B81E),
            //                           Color(0xAFFB0C81F),
            //                         ]),
            //                       ),
            //                       SizedBox(
            //                         width: 15,
            //                       ),
            //                       Text(
            //                         S.current.delivery_price,
            //                         style: TextStyle(
            //                           color: textColor,
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w400,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               Padding(
            //                 padding: const EdgeInsets.only(
            //                     right: 10.99, left: 16),
            //                 child: Divider(
            //                   color: Colors.grey,
            //                 ),
            //               ),
            //               Row(
            //                 mainAxisAlignment:
            //                     MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text(
            //                     '92,00 ${S.current.rs}',
            //                     style: TextStyle(
            //                       color: button1color,
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w700,
            //                     ),
            //                   ),
            //                   Text(
            //                     S.current.rs,
            //                     style: TextStyle(
            //                       color: button1color,
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w400,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         )),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            totalcart != 0
                ? Container(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: buttonLightcolor.withOpacity(0.2),
                              border: Border.all(
                                color: buttonLightcolor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 11, left: 21),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${totalprice} ${S.current.rs}',
                                    style: TextStyle(
                                      color: button1color,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    S.current.total_calculted_amount,
                                    style: TextStyle(
                                      color: button1color,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  )
                : Container(),
            SizedBox(
              height: 26,
            ),
            totalcart != 0
                ? Padding(
                    padding: const EdgeInsets.only(right: 25, left: 25),
                    child: ingridentbutton(
                      color1: button1color,
                      color2: button2color,
                      width: 360,
                      height: 56,
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderDetails(
                                      total: totalcart.toString(),
                                      totalprice: totalprice.toString(),
                                      model: widget.model,
                                    )));
                      },
                      text: S.current.order_now,
                    ),
                  )
                : Container()
          ],
        );
      },
    );
  }
}
