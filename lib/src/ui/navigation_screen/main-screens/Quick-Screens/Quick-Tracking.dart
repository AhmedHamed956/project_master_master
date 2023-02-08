import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Models/getNonReadyQuick.dart';
import 'package:project/Models/getNonReadyQuick.dart';
import 'package:project/Models/getNonReadyQuick.dart';
import 'package:project/src/network/remote/Dio_helper.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import '../../../../../Models/getNonReadyQuick.dart';
import '../../../../../generated/l10n.dart';
import '../../../Shared/constant.dart';

class QuickTraking extends StatefulWidget {
  const QuickTraking({super.key});

  @override
  State<QuickTraking> createState() => _QuickTrakingState();
}

final bool _running = true;

int? stepper;

Stream<String> _stream(context) async* {
  while (_running) {
    await Future<void>.delayed(const Duration(seconds: 5));
    HomeCubit().getNonReadyQuickData();
  }
  // This loop will run forever because _running is always true
}

class _QuickTrakingState extends State<QuickTraking> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getNonReadyQuickData(),
        child: BlocConsumer<HomeCubit, HomeAppState>(
          listener: (context, state) {
            if (state is GetNonReadyQuickSuccessStates) {
              // setState(() {
              //   stepper = HomeCubit.get(context)
              //       .getnonReadyQuickModel
              //       ?.data
              //       ?.first
              //       .step;
              // });
            }
          },
          builder: (context, state) {
            var model = HomeCubit.get(context).getnonReadyQuickModel;

            return ConditionalBuilder(
              condition: HomeCubit.get(context).getnonReadyQuickModel != null,
              builder: (context) {
                return Scaffold(
                    body: Container(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 26, left: 30, top: 3, bottom: 5),
                            child: Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    S.current.track_order,
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              height: 50,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    child: Transform.rotate(
                                      angle: 283 / 90.0,
                                      child: ClipPath(
                                        clipper:
                                            CustomClipPathTopContainerSecond(),
                                        child: Container(
                                          height: 34,
                                          width: 140,
                                          color: stepper == 3
                                              ? purpleColor
                                              : Colors.grey,
                                          child: Center(
                                              child: Transform.rotate(
                                                  angle: 283 / 90.0,
                                                  child: Text(
                                                    S.current.paying_off,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 125,
                                    child: Transform.rotate(
                                      angle: 283 / 90.0,
                                      child: ClipPath(
                                        clipper:
                                            CustomClipPathTopContainerSecond(),
                                        child: Container(
                                          height: 34,
                                          width: 140,
                                          color: stepper == 2
                                              ? purpleColor
                                              : Colors.grey,
                                          child: Center(
                                              child: Transform.rotate(
                                                  angle: 283 / 90.0,
                                                  child: Text(
                                                    S.current.suggestions,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 250,
                                    child: Transform.rotate(
                                      angle: 283 / 90.0,
                                      child: ClipPath(
                                        clipper:
                                            CustomClipPathTopContainerOne(),
                                        child: Container(
                                          height: 34,
                                          width: 140,
                                          color: stepper == 1
                                              ? purpleColor
                                              : Colors.grey,
                                          child: Center(
                                              child: Transform.rotate(
                                                  angle: 283 / 90.0,
                                                  child: Text(
                                                    S.current.find_a_shop,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          StreamBuilder(
                            // initialData: model,
                            stream: _stream(context),
                            builder: (context, snapshot) {
                              return Expanded(
                                child: GridView.count(
                                  scrollDirection: Axis.vertical,

                                  shrinkWrap: true,
                                  primary: false,
                                  padding: const EdgeInsets.all(20),
                                  childAspectRatio:
                                      (MediaQuery.of(context).orientation ==
                                              Orientation.landscape)
                                          ? 2
                                          : 1,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 12,
                                  crossAxisCount: 2,

                                  children: List.generate(1, (index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: cardcolor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 9, left: 8, right: 8),
                                            width: 160,
                                            height: 100,
                                            child: Image.network(
                                                '${domainlink}${model?.data![index].productsData?.masterImage}',
                                                fit: BoxFit.fill),
                                          ),
                                          SizedBox(
                                            height: 29,
                                          ),
                                          Text(
                                            '${model?.data![index].productsData?.priceAfterDiscount} ${S.current.rs}',
                                            style: TextStyle(
                                                color: textColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    );
                                  }),

                                  // ),
                                ),
                              );
                            },
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 43),
                              child: Container(
                                  height: 56,
                                  width: 360,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [button1color, button2color],
                                      ),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                      child: Text(S.current.accept,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)))))
                          // Padding(
                          //     padding:
                          //         const EdgeInsets.only(left: 20, right: 20, bottom: 43),
                          //     child: Container(
                          //         height: 56,
                          //         width: 360,
                          //         decoration: BoxDecoration(
                          //             color: cancelButtonColor,
                          //             borderRadius: BorderRadius.circular(4)),
                          //         child: Center(
                          //             child: Text(S.current.reject_all_suggestions,
                          //                 style: TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 16,
                          //                     fontWeight: FontWeight.w700)))))
                        ])));
              },
              fallback: (BuildContext context) => Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: button2color,
                  ),
                ),
              ),
            );
          },
        ));
  }
}

class CustomClipPathTopContainerOne extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Colors.black;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(0, size.height * 0.4890143);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.8545167, 0);
    path0.lineTo(size.width, size.height * 0.4991714);
    path0.lineTo(size.width * 0.8551250, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width * 0.0013417, size.height);
    path0.lineTo(0, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomClipPathTopContainerSecond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Colors.black;

    Path path0 = Path();
    path0.moveTo(size.height, 0);
    path0.lineTo(size.width * 0.1459833, size.height * 0.5012000);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.8545167, 0);
    path0.lineTo(size.width, size.height * 0.4991714);
    path0.lineTo(size.width * 0.8551250, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width * 0.0013417, size.height);
    path0.lineTo(0, size.height);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
