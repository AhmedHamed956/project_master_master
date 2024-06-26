import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/GetCartData_response.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import '../../../Models/model/cart_data.dart';
import '../../../generated/l10n.dart';
import '../Shared/constant.dart';
import '../components/appar.dart';
import '../widgets/card-widget.dart';

class AddToCart extends StatefulWidget {
  final id;

  const AddToCart({super.key, this.id});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late var idd;

  @override
  void initState() {
    idd = widget.id;
    print(idd);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
    //   BlocProvider(
    //   create: (BuildContext context) => HomeCubit()..getCartData(id: idd),
    //   child:
    BlocConsumer<HomeCubit, HomeAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: state is GetCartSuccessStates,
              builder: (context) {
                return getcartScreen(
                    HomeCubit.get(context).getCartModel!.data!.first,
                    HomeCubit.get(context).getCartModel!);
              },
              fallback: ((context) => Container(
                  color: Colors.white,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: button2color,
                  )))));
        },
      // ),
    );

    // create: (context) => HomeCubit()..getCartData(id: idd),
  }

  Widget getcartScreen(CartModel model, GetCartResponse model2) => Scaffold(
        backgroundColor: mainBackgourndColor,
        appBar: AddToCardAppBar(label: S.current.basket, id: widget.id),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                                        "${domainlink}${model.shopData!.background}"),
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
                                      model.shopData!.storeName.toString(),
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
              CardWidget( shopId: widget.id),
            ],
          ),
        ),
      );

// incrementCart(CartModel cart) {
//   if (cart.quantity! <= 99) {
//     setState(() {
//       cart.quantity = (cart.quantity! + 1);
//     });
//     cartBloc.add(UpdateCartEvent(cartModel: cart));
//     calculateSubTotal();
//   }
// }
//
// decrementCart(CartModel cart) {
//   if (cart.quantity! > 1) {
//     setState(() {
//       cart.quantity = (cart.quantity! - 1);
//     });
//
//     cartBloc.add(UpdateCartEvent(cartModel: cart));
//     calculateSubTotal();
//   }
// }
}
