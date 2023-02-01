import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/offers_Model.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/components/component.dart';
import 'package:project/src/ui/navigation_screen/main-screens/digital-Screens/digital-Screen.dart';
import 'package:project/src/ui/navigation_screen/main-screens/quick-screen.dart';
import 'package:project/src/ui/navigation_screen/offers-screen/one_Offer_screen.dart';

import '../../widgets/order-widgets/orderPrepare-widget.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..offerScreen(),
      child: BlocConsumer<HomeCubit, HomeAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
              condition: HomeCubit.get(context).offersModel != null,
              builder: (context) =>
                  offerscreen(HomeCubit.get(context).offersModel!),
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

  Widget offerscreen(OffersModel model) => Scaffold(
        backgroundColor: mainBackgourndColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: ListView.separated(
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  offerItem(context, model.data![index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 21,
                  ),
              itemCount: model.data!.length),
        ),
      );

  Widget offerItem(context, OffersData model) => InkWell(
        onTap: () {
          if (model.directedTo == 'quick') {
            var title = "${S.current.offer} ${S.current.quick}";
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => QuickScreen(
                        title: title,
                        type: 'offer',
                      )),
            );
          }
          if (model.directedTo == 'digital') {
            var title = "${S.current.offer} ${S.current.digital_gifts}";
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => DigtalScreen(
                        title: title,
                        type: 'offer',
                      )),
            );
          }
          if (model.directedTo == 'shops') {
            var title = "${S.current.offer} ${S.current.shops}";
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => ShopsOffers(
                        title: title,
                      )),
            );
          }
        },
        child: Container(
          height: 210,
          width: 405,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: buttonLightcolor,
            ),
          ),
          child: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 133,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        10,
                      ),
                      topLeft: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage('${domainlink}${model.image}'),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${model.name}',
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: GradientIcon(
                      Icons.info,
                      20.0,
                      const LinearGradient(
                        colors: <Color>[
                          button1color,
                          button2color,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    '${model.dis}',
                    style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ]),
        ),
      );
}
