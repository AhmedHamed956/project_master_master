// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:project/src/ui/ShopDetails/shopDateils.dart';

// import '../../../generated/l10n.dart';
// import '../Shared/constant.dart';

// class ShopItem extends StatelessWidget {
//   final model;
//   const ShopItem({super.key, this.model});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10, left: 13),
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(color: buttonLightcolor),
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10))),
//         child: Column(
//           children: [
//             InkWell(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => ShopDetails()));
//               },
//               child: Container(
//                 // height: 142,
//                 // width: 405,
//                 decoration: const BoxDecoration(
//                     // color: Colors.red,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10))),
//                 child: Center(
//                     child: Image.asset('assets/icons/Rectangle 7863.png')),
//               ),
//             ),
//             Container(
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10))),
//               height: 70,
//               width: 405,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                         child: Container(
//                             height: 57,
//                             width: 65,
//                             child: Center(
//                                 child:
//                                     Image.asset('assets/icons/image 168.png'))),
//                       ),
//                       SizedBox(
//                         width: 9,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'اسم متجر البائع',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                                 color: textColor),
//                           ),
//                           Text(
//                             ' وصف بسيط للتاجر',
//                             style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                                 color: textColor),
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 height: 18.3,
//                                 width: 29,
//                                 child: Text(
//                                   "${'(4.8)'}",
//                                   style: TextStyle(
//                                       color: textColor,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ),
//                               Container(
//                                 height: 11,
//                                 width: 14.25,
//                                 child: SvgPicture.asset(
//                                   'assets/icons/home/Vector-3.svg',
//                                 ),
//                               ),
//                               Container(
//                                 height: 11,
//                                 width: 14.25,
//                                 child: SvgPicture.asset(
//                                   'assets/icons/home/Vector-2.svg',
//                                 ),
//                               ),
//                               Container(
//                                 height: 11,
//                                 width: 14.25,
//                                 child: SvgPicture.asset(
//                                   'assets/icons/home/Vector-2.svg',
//                                 ),
//                               ),
//                               Container(
//                                 height: 11,
//                                 width: 14.25,
//                                 child: SvgPicture.asset(
//                                   'assets/icons/home/Vector-2.svg',
//                                 ),
//                               ),
//                               Container(
//                                 height: 11,
//                                 width: 14.25,
//                                 child: SvgPicture.asset(
//                                   'assets/icons/home/Vector-2.svg',
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
//                     child: Column(
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               height: 22,
//                               width: 21,
//                               child: SvgPicture.asset(
//                                   'assets/icons/home/location_ic.svg'),
//                             ),
//                             SizedBox(
//                               width: 6,
//                             ),
//                             Container(
//                               height: 19,
//                               width: 45,
//                               child: Text(
//                                 "1.2 ${S.current.km}",
//                                 style: TextStyle(
//                                     color: textColor,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 4,
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               height: 17,
//                               width: 18,
//                               child: SvgPicture.asset(
//                                   'assets/icons/home/Vector-9.svg'),
//                             ),
//                             SizedBox(
//                               width: 6,
//                             ),
//                             Container(
//                               height: 19,
//                               width: 45,
//                               child: Text(
//                                 "30 ${S.current.min}",
//                                 style: TextStyle(
//                                     color: textColor,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   ///////////////////////////////////

//                   /////////////////////////////////////////////////////////
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
