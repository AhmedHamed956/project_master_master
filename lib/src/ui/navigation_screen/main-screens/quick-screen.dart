import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/get_QuickProduct_model.dart';
import 'package:project/src/common/global.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import 'package:project/src/ui/Shared/constant.dart';
import '../../../../generated/l10n.dart';
import '../../components/appar.dart';
import 'package:project/src/ui/components/component.dart';

import '../../widgets/quick-widget.dart';

class QuickScreen extends StatefulWidget {
  final String? title;
  final String? type;
  const QuickScreen({super.key, this.title, this.type});

  @override
  State<QuickScreen> createState() => _QuickScreenState();
}

class _QuickScreenState extends State<QuickScreen> {
  TextEditingController quickController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    return BlocProvider(
        create: (context) => HomeCubit()..getQuickData(),
        child: BlocConsumer<HomeCubit, HomeAppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
                condition: HomeCubit.get(context).getQuickModel != null,
                builder: (context) =>
                    quickScreen(context, HomeCubit.get(context).getQuickModel!),
                fallback: ((context) => Container(
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: button2color,
                        ),
                      ),
                    )));
          },
        ));
  }

  Widget quickScreen(context, GetQuickModel model) => Scaffold(
        backgroundColor: mainBackgourndColor,
        appBar: QiuckAppBarWidget(
          label:
              widget.title != null ? widget.title.toString() : S.current.quick,
          type: widget.type,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            widget.type != 'offer'
                ? Padding(
                    padding: const EdgeInsets.only(right: 7, left: 16, top: 17),
                    child: Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: shadowColor.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(0, -4), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Container(
                                width: 40,
                                height: 24,
                                child: Image.asset(
                                    'assets/icons/system-uicons_filtering.png')),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: defaulttextfield(
                                controller: quickController,
                                type: TextInputType.text,
                                // prefix: Icons.search,
                                isQuickSearch: true,
                                iconColor: textColor,
                                hinttext: S.current.search,
                                prefix: Icons.search,
                                fontsize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                primary: false,
                padding: const EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (MediaQuery.of(context).orientation ==
                          Orientation.landscape)
                      ? 2
                      : 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 12,
                  crossAxisCount: 2,
                ),
                itemCount: model.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return QuickWidget(model: model.data![index]);
                        },
                        context: context,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 110,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Image.network(
                                  '${domainlink}${model.data![index].masterImage}',
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  langKey == 'ar'
                                      ? '${model.data![index].translations!.first.name}'
                                      : '${model.data![index].translations!.last.name}',
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '${model.data![index].priceAfterDiscount} ${S.current.rs}',
                                  style: TextStyle(
                                      color: borderColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                            ),
                            child: Row(
                              children: [
                                Container(
                                    child: Flexible(
                                  child: Text(
                                    langKey == 'ar'
                                        ? '${model.data![index].translations!.first.dis}'
                                        : '${model.data![index].translations!.last.dis}',
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w400,
                                        color: textColor),
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            // GridView.count(
            //   scrollDirection: Axis.vertical,
            //   shrinkWrap: true,
            //   primary: false,
            //   padding: const EdgeInsets.all(20),
            //   childAspectRatio:
            //       (MediaQuery.of(context).orientation == Orientation.landscape)
            //           ? 2
            //           : 1,

            //   crossAxisSpacing: 16,
            //   mainAxisSpacing: 12,
            //   crossAxisCount: 2,

            //   children: List.generate(model.data[], (index) {
            //     return InkWell(
            //       onTap: () {
            //         showModalBottomSheet(
            //           isScrollControlled: true,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10.0),
            //           ),
            //           backgroundColor: Colors.white,
            //           builder: (BuildContext context) {
            //             return QuickWidget();
            //           },
            //           context: context,
            //         );
            //       },
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(20.0),
            //         ),
            //         child: Column(
            //           children: [
            //             Container(
            //               width: MediaQuery.of(context).size.width,
            //               height: 100,
            //               child: Image.asset('assets/icons/Rectangle 7891.png',
            //                   fit: BoxFit.fill),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 7),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Text(
            //                     'اسم المنتج',
            //                     style: TextStyle(
            //                         color: textColor,
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.w700),
            //                   ),
            //                   Text(
            //                     '100 ${S.current.rs}',
            //                     style: TextStyle(
            //                         color: borderColor,
            //                         fontSize: 14,
            //                         fontWeight: FontWeight.w400),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(
            //                 horizontal: 7,
            //               ),
            //               child: Row(
            //                 children: [
            //                   Container(
            //                       child: Flexible(
            //                     child: Text(
            //                       'يمكن عرض ويمكن عرض وصف العنصر هنا',
            //                       style: TextStyle(
            //                           fontSize: 12.0,
            //                           fontWeight: FontWeight.w400,
            //                           color: textColor),
            //                     ),
            //                   )),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   }),

            //   // children: <Widget>[
            //   //   Container(
            //   //     padding: const EdgeInsets.all(8),
            //   //     decoration: BoxDecoration(
            //   //       color: Colors.white,
            //   //       borderRadius: BorderRadius.circular(20.0),
            //   //     ),
            //   //     child: const Text("He'd have you all unravel at the"),
            //   // ),
            //   // Container(
            //   //   padding: const EdgeInsets.all(8),
            //   //   color: Colors.teal[200],
            //   //   child: const Text('Heed not the rabble'),
            //   // ),
            //   // Container(
            //   //   padding: const EdgeInsets.all(8),
            //   //   color: Colors.teal[300],
            //   //   child: const Text('Sound of screams but the'),
            //   // ),
            //   // Container(
            //   //   padding: const EdgeInsets.all(8),
            //   //   color: Colors.teal[400],
            //   //   child: const Text('Who scream'),
            //   // ),
            //   // Container(
            //   //   padding: const EdgeInsets.all(8),
            //   //   color: Colors.teal[500],
            //   //   child: const Text('Revolution is coming...'),
            //   // ),
            //   // Container(
            //   //   padding: const EdgeInsets.all(8),
            //   //   color: Colors.teal[600],
            //   //   child: const Text('Revolution, they...'),
            //   // ),
            // )
          ]),
        ),
      );
}
