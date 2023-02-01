import 'package:flutter/material.dart';
import 'package:project/src/network/remote/endPoint.dart';
import 'package:project/src/ui/Cart_Shops/Add_To_Cart.dart';
import 'package:project/src/ui/Home/Home.dart';
import 'package:project/src/ui/navigation_screen/offers-screen/offers-screen.dart';
import 'package:project/src/ui/navigation_screen/settings/profile/settings-Screen.dart';

import '../Shared/constant.dart';
import '../ShopDetails/shopDateils.dart';

class RegularAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double size = 22;
  late String label;
  Image? icon;
  Widget? widget;
  TextStyle? textStyle;

  RegularAppBar({required this.label, this.widget, this.textStyle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(

        // height: MediaQuery.of(context).size.height * 0.11,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: appbarcolor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                  // IconButton(
                                  //     onPressed: () => Navigator.pop(context),
                                  //     icon: Icon(
                                  //       Icons.arrow_back,
                                  //       color: Colors.black,
                                  //     )),
                                  SizedBox(width: 16),
                                  Container(child: icon)
                                ])),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: widget)
                          ]))),
              Container(
                  width: double.infinity, color: Color(0xffeeeeee), height: 1.5)
            ]));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AddToCardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double size = 22;
  late String label;
  Image? icon;
  Widget? widget;
  TextStyle? textStyle;

  dynamic? id;
  AddToCardAppBar(
      {required this.label, this.widget, this.textStyle, this.icon, this.id});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appbarcolor,
      leading: InkWell(
        onTap: () {
          //  Navigator.pop(context);
          Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => ShopDetails(
                id: id.toString(),
              ),
            ),
          );
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => ShopDetails(
          //               id: '1',
          //             )));
        },
        child: Container(
          height: 40,
          width: 40,
          child: Image.asset('assets/icons/arrowBack.png'),
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 20),
      //     child: Container(
      //       height: 40,
      //       width: 40,
      //       child: Image.asset('assets/icons/search.png'),
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double size = 22;
  late String label;
  Image? icon;
  Widget? widget;
  TextStyle? textStyle;

  String? type;

  AppBarWidget(
      {required this.label, this.widget, this.textStyle, this.icon, this.type});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appbarcolor,
      leading: InkWell(
        onTap: () {
          type == "gift_card"
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            index: 4,
                          )))
              : Navigator.pop(context);
        },
        child: Container(
          height: 40,
          width: 40,
          child: Image.asset('assets/icons/arrowBack.png'),
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 20),
      //     child: Container(
      //       height: 40,
      //       width: 40,
      //       child: Image.asset('assets/icons/search.png'),
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class WebViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double size = 22;
  late String label;
  Image? icon;
  Widget? widget;
  TextStyle? textStyle;

  String? type;

  WebViewAppBar(
      {required this.label, this.widget, this.textStyle, this.icon, this.type});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appbarcolor,
      leading: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        index: 4,
                      )));
        },
        child: Container(
          height: 40,
          width: 40,
          child: Image.asset('assets/icons/arrowBack.png'),
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 20),
      //     child: Container(
      //       height: 40,
      //       width: 40,
      //       child: Image.asset('assets/icons/search.png'),
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class QiuckAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double size = 22;
  late String label;
  Image? icon;
  Widget? widget;
  TextStyle? textStyle;

  String? type;

  QiuckAppBarWidget(
      {required this.label, this.widget, this.textStyle, this.icon, this.type});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appbarcolor,
      leading: InkWell(
        onTap: () {
          type == "offer"
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            index: 1,
                          )))
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            index: 0,
                          )));
        },
        child: Container(
          height: 40,
          width: 40,
          child: Image.asset('assets/icons/arrowBack.png'),
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 20),
      //     child: Container(
      //       height: 40,
      //       width: 40,
      //       child: Image.asset('assets/icons/search.png'),
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class DigitalAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double size = 22;
  late String label;
  Image? icon;
  Widget? widget;
  TextStyle? textStyle;

  String? type;

  DigitalAppBarWidget(
      {required this.label, this.widget, this.textStyle, this.icon, this.type});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: appbarcolor,
      leading: InkWell(
        onTap: () {
          type == "offer"
              ? Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            index: 1,
                          )))
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            index: 0,
                          )));
        },
        child: Container(
          height: 40,
          width: 40,
          child: Image.asset('assets/icons/arrowBack.png'),
        ),
      ),
      title: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 20),
      //     child: Container(
      //       height: 40,
      //       width: 40,
      //       child: Image.asset('assets/icons/search.png'),
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

// class GiftBarWidget extends StatelessWidget implements PreferredSizeWidget {
//   final double size = 22;
//   late String label;
//   Image? icon;
//   Widget? widget;
//   TextStyle? textStyle;

//   GiftBarWidget({
//     required this.label,
//     this.widget,
//     this.textStyle,
//     this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: appbarcolor,
//       leading: InkWell(
//         onTap: () {
        
//         },
//         child: Container(
//           height: 40,
//           width: 40,
//           child: Image.asset('assets/icons/arrowBack.png'),
//         ),
//       ),
//       title: Text(
//         label,
//         style: TextStyle(
//           color: textColor,
//           fontSize: 18,
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//       centerTitle: true,
//       // actions: [
//       //   Padding(
//       //     padding: const EdgeInsets.only(right: 20),
//       //     child: Container(
//       //       height: 40,
//       //       width: 40,
//       //       child: Image.asset('assets/icons/search.png'),
//       //     ),
//       //   ),
//       // ],
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }
