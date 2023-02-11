import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/GetCartData_response.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Cart_Shops/Add_To_Cart.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/components/appar.dart';

import '../../../Models/model/cart_data.dart';
import '../../../Models/model/product_data.dart';
import '../../../Models/model/products_data.dart';
import '../../../generated/l10n.dart';
import '../Cart_Shops/order-details.dart';
import '../Shared/constant.dart';
import '../components/component.dart';

class CardWidget extends StatefulWidget {
  // GetCartResponse model2;
  int shopId;

  CardWidget(
      {
      // required this.model2,
      required this.shopId});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int? counter;
  List<int> _counter = [];

  //  model.products!.first.quantity!.toInt();
  late int? totalcart = 0;
  late int totalprice = 0;
  late int? price;

  late int quantity;
  CartModel? model;
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = BlocProvider.of<HomeCubit>(context);
    _homeCubit.getCartData(id: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainBackgourndColor,
        appBar: AddToCardAppBar(label: S.current.basket, id: widget.shopId),
        body: BlocConsumer<HomeCubit, HomeAppState>(listener: (context, state) {
          if (state is GetCartSuccessStates) {
            print("GetCartSuccessStates");

            model = state.model!;
            totalcart = model?.total;
            totalprice = model?.totalPrice!.toInt() ?? 0;
          }
          if (state is UpdateCartSuccessStates) {
            print("UpdateCartSuccessStates");
            _homeCubit.getCartData(id: widget.shopId);
          }
        }, builder: (context, state) {
          return SingleChildScrollView(
              child: Column(children: [
            Row(
              children: [
                Container(
                  height: 80,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                      "${domainlink}${model?.shopData!.background}"),
                                  backgroundColor: Colors.transparent,
                                )),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 200),
                                  child: Text(
                                    model?.shopData?.storeName ?? "",
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  S.current.gifts,
                                  style: const TextStyle(
                                    color: textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(children: [
              Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset:
                              const Offset(0, -4), // changes position of shadow
                        )
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  // width: 360,
                  height: totalcart != 0
                      ? MediaQuery.of(context).size.height / 3
                      : MediaQuery.of(context).size.height - 100,
                  child: totalcart != 0
                      ? ConditionalBuilder(
                          condition: model != null,
                          builder: (context) {
                            // for (int i = 0; i < model2.data!.length; i++)
                            return ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                quantity =
                                    model!.products![index].quantity!.toInt();

                                return CartItemWidget(
                                    index: index,
                                    decrement: decrement,
                                    increment: increment,
                                    delete: _deleteTap,
                                    model:
                                        model!.products![index].productsData!,
                                    products: model!.products!);
                              },
                              itemCount: model!.products!.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Padding(
                                padding: EdgeInsets.only(right: 25, left: 22),
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
                          fallback: (context) =>
                              const CircularProgressIndicator(
                                  color: button2color))
                      : const Center(
                          child: CircularProgressIndicator(color: button2color))
                  // Container(
                  //         child: Center(
                  //             child: Text(
                  //           langKey == 'ar' ? "السلة فارغه" : "Basket is Empty",
                  //           style: TextStyle(
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.w700,
                  //               color: textColor),
                  //         )),
                  //       )
                  ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${totalcart} ${S.current.rs}',
                                        style: const TextStyle(
                                          color: textColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        S.current.total_amount,
                                        style: const TextStyle(
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
                                        '${model?.deliveryCost} ${S.current.rs}',
                                        style: const TextStyle(
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
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color(0xAFF59B81E),
                                              Color(0xAFFB0C81F),
                                            ]),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            S.current.delivery_price,
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
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(right: 10.99, left: 16),
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
                                        style: const TextStyle(
                                          color: button1color,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        S.current.total,
                                        style: const TextStyle(
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
              const SizedBox(
                height: 10,
              ),
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
                                      style: const TextStyle(
                                        color: button1color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      S.current.total_calculted_amount,
                                      style: const TextStyle(
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
              const SizedBox(
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
                                        model: model,
                                      )));
                        },
                        text: S.current.order_now,
                      ))
                  : Container()
            ])
          ]));
        }));
  }

  void _deleteTap(int index, List<Products> products, ProductData model) {
    HomeCubit().deleteCartOrder(id: products[index].id, shopID: model.shopId);
    setState(() {
      totalprice = (totalprice -
          (products[index].quantity!.toInt() *
              int.parse(model.priceAfterDiscount.toString())));
      totalcart = (totalcart! -
          (products[index].quantity!.toInt() *
              int.parse(model.priceAfterDiscount.toString())));
      products.removeAt(index);
    });
    Navigator.pop(context);
  }

  void increment(int index, List<Products> products, ProductData productData) {
    HomeCubit().updateCart(
        productID: productData.id,
        quantity: 1,
        id: widget.shopId,
        context: context);

    setState(() {
      counter = products[index].quantity!.toInt() + 1;
      price = int.parse(productData.priceAfterDiscount.toString());

      totalcart = (totalcart! + price!);
      totalprice = totalprice + price!;
      total = totalcart!;
    });
  }

  void decrement(int index, List<Products> products, ProductData productData) {
    print(counter);
    counter == 0
        ? HomeCubit()
            .deleteCartOrder(id: products[index].id, shopID: model?.shopId)
        : HomeCubit().updateCart(
            productID: productData.id,
            quantity: -1,
            id: widget.shopId,
            context: context);

    setState(() {
      price = int.parse(productData.priceAfterDiscount.toString());

      totalcart = (totalcart! - price!);
      totalprice = totalprice - price!;
      total = totalcart!;
    });
  }
}

class CartItemWidget extends StatelessWidget {
  int index;
  ProductData model;
  List<Products> products;
  Function(int index, List<Products> products, ProductData productData)
      increment;

  Function(int index, List<Products> products, ProductData productData)
      decrement;
  Function(int index, List<Products> products, ProductData productData) delete;

  CartItemWidget(
      {required this.model,
      required this.increment,
      required this.decrement,
      required this.index,
      required this.products,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 28, right: 25, left: 22, bottom: 22),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  content: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'هل تريد مسح العنصر من السلة',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: textColor),
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            child: Container(
                                              child: const Center(
                                                child: Text(
                                                  "نعم",
                                                  style: TextStyle(
                                                      color: button2color),
                                                ),
                                              ),
                                            ),
                                            onTap: () =>
                                                delete(index, products, model),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              child: const Center(
                                                child: Text(
                                                  "لا",
                                                  style: TextStyle(
                                                      color: button2color),
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
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Container(
                          width: 25.31,
                          height: 25,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/icons/Vector-8.png'),
                                  fit: BoxFit.fill)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Text(
                      '${model.priceAfterDiscount} ${S.current.rs}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: textColor),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        langKey == 'ar'
                            ? Text(
                                '${model.translations!.first.name}',
                                style: const TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : Text(
                                '${model.translations!.last.name}',
                                style: const TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () => decrement(index, products, model),
                                child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: textColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: textColor),
                                    )))),
                            const SizedBox(
                              width: 13,
                            ),
                            Text(
                              // counter == null
                              // ?
                              '${products[index].quantity!.toInt()}',
                              // : "$counter",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: textColor),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            InkWell(
                              onTap: () => increment(index, products, model),
                              child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: purpleColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: purpleColor),
                                  ))),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
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
                    //     '${domainlink}${model.masterImage}',
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
