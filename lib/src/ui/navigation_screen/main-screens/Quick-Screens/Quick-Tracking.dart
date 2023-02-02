import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/ui/Home/Cubit.dart';
import 'package:project/src/ui/Home/states.dart';

import '../../../../../generated/l10n.dart';
import '../../../Shared/constant.dart';

class QuickTraking extends StatelessWidget {
  const QuickTraking({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getNonReadyQuickData(),
        child: BlocConsumer<HomeCubit, HomeAppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                body: Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
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
                                    clipper: CustomClipPathTopContainerSecond(),
                                    child: Container(
                                      height: 34,
                                      width: 140,
                                      color: Colors.grey,
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
                                    clipper: CustomClipPathTopContainerSecond(),
                                    child: Container(
                                      height: 34,
                                      width: 140,
                                      color: Colors.grey,
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
                                    clipper: CustomClipPathTopContainerOne(),
                                    child: Container(
                                      height: 34,
                                      width: 140,
                                      color: purpleColor,
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
                      Expanded(
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
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 9, left: 8, right: 8),
                                    width: 160,
                                    height: 100,
                                    child: Image.asset(
                                        'assets/icons/Rectangle 7891.png',
                                        fit: BoxFit.fill),
                                  ),
                                  SizedBox(
                                    height: 29,
                                  ),
                                  Text(
                                    '600 ${S.current.rs}',
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
