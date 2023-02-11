import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/profile_Gift_Model.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/components/appar.dart';
import 'package:project/src/ui/widgets/widgets.dart';

import '../../../../../generated/l10n.dart';
import '../../../../common/global.dart';
import '../../../widgets/gift-card-widget.dart';

class GiftCardScreen extends StatefulWidget {
  const GiftCardScreen({super.key});

  @override
  State<GiftCardScreen> createState() => _GiftCardScreenState();
}

class _GiftCardScreenState extends State<GiftCardScreen> {
  late HomeCubit homeCubit;
  int currentindex = 3;

  @override
  void initState() {
    homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.getProfieGiftData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeAppState>(listener: (context, state) {
      if (state is PostGiftOrderSuccessStates) {
        // showSnackBar(title: state.message ?? "error");

        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const GiftCardScreen()));
      }
    }, builder: (context, state) {
      return ConditionalBuilder(
          condition: HomeCubit.get(context).profileGiftModel != null,
          builder: (context) => profileGiftScreen(
              currentindex, HomeCubit.get(context).profileGiftModel!),
          fallback: (context) => Container(
              color: Colors.white,
              child: const Center(
                  child: CircularProgressIndicator(
                color: button2color,
              ))));
    });
  }

  Widget profileGiftScreen(int currentindex, ProfileGiftModel model) =>
      Scaffold(
          backgroundColor: mainBackgourndColor,
          body: ListView(children: [
            AppBarWidget(label: S.current.gift_cards, type: 'gift_card'),
            const SizedBox(height: 35),
            Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset: const Offset(0, -4))
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: model.data!.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => GiftCardWidget(
                                model: model.data![index],
                                homeCubit: homeCubit),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemCount: model.data!.length))
                    : Container(
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            S.current.youdonthaveGiftCard,
                            style: const TextStyle(
                                color: textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        )))
          ]));
}
