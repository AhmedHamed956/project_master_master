// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class PurchaseBottomSheet extends StatelessWidget {
//   const PurchaseBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: showModalBottomSheet(
//           isScrollControlled: true,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           backgroundColor: Colors.white,
//           builder: (BuildContext context) {
//             return FractionallySizedBox(
//               heightFactor: 0.9,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 220,
//                       width: 428,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10)),
//                         color: Colors.red,
//                         image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image:
//                               AssetImage("assets/icons/Rectangle 7863-2 2.png"),
//                         ),
//                       ),
//                       // child:
//                       //     Image.asset('assets/icons/Rectangle 7863-2 2.png'),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(top: 25, left: 23, right: 23),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '41,00 ر.س',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700,
//                                 color: indicatorColor),
//                           ),
//                           Text(
//                             ' Gerberas and Lilies: عالم الأحلام',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w700,
//                                 color: textColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 30, right: 23),
//                       child: Row(
//                         children: [
//                           Text(' 55,00 ر.س',
//                               style: TextStyle(
//                                   decoration: TextDecoration.lineThrough,
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.w400,
//                                   color: textColor)),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 9,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 23, right: 23),
//                       child: Container(
//                         height: 71,
//                         width: 377,
//                         child: Text(
//                           "يمكن عرض وصف العنصر هنا يمكن عرض وصف العنصر هنا يمكن عرض وصف العنصر هنا ويمكن عرض وصف العنصر هنا ويمكن عرض وصف العنصر هنا",
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: textColor),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 23, right: 23),
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 33,
//                             width: 91,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4),
//                                 gradient: const LinearGradient(
//                                     begin: Alignment.topRight,
//                                     end: Alignment.bottomLeft,
//                                     colors: [button2color, button1color])),
//                             child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'جدولة',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w400,
//                                         color: Colors.white),
//                                   ),
//                                   SizedBox(
//                                     width: 8,
//                                   ),
//                                   Container(
//                                       width: 25.31,
//                                       height: 25,
//                                       child: Image.asset(
//                                           'assets/icons/Vector-5.png'))
//                                 ]),
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Container(
//                             height: 33,
//                             width: 80,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4),
//                                 gradient: quickButton),
//                             child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'طلب كويك',
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w400,
//                                         color: Colors.white),
//                                   ),
//                                 ]),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 21,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 13, right: 16),
//                       child: Container(
//                         width: 399,
//                         height: 40,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             border: Border.all(
//                               color: lighttextColor,
//                               width: 1,
//                             )),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 19.5, right: 18),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 // mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   Container(
//                                     height: 15,
//                                     width: 14.25,
//                                     child: Image.asset('assets/icons/Star.png'),
//                                   ),
//                                   Container(
//                                     height: 15,
//                                     width: 14.25,
//                                     child: Image.asset('assets/icons/Star.png'),
//                                   ),
//                                   Container(
//                                     height: 15,
//                                     width: 14.25,
//                                     child: Image.asset('assets/icons/Star.png'),
//                                   ),
//                                   Container(
//                                     height: 15,
//                                     width: 14.25,
//                                     child: Image.asset('assets/icons/Star.png'),
//                                   ),
//                                   Container(
//                                     height: 15,
//                                     width: 14.25,
//                                     child: Image.asset(
//                                         'assets/icons/Star half.png'),
//                                   ),
//                                   const SizedBox(
//                                     width: 9,
//                                   ),
//                                   Container(
//                                     height: 18.3,
//                                     width: 29,
//                                     child: const Text(
//                                       "${'(4.8)'}",
//                                       style: TextStyle(
//                                           color: textColor,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 child: Text(
//                                   'اسم متجر البائع',
//                                   style: TextStyle(
//                                       color: textColor,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 28, right: 34),
//                       child: Container(
//                           height: 45,
//                           width: 366,
//                           decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                   begin: Alignment.topRight,
//                                   end: Alignment.bottomLeft,
//                                   colors: [button2color, button1color])),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 12, right: 12),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   '41,00 ر.س',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                       color: Colors.white),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'اضف الى السلة ',
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.white),
//                                     ),
//                                     SizedBox(
//                                       width: 3,
//                                     ),
//                                     Container(
//                                         height: 15,
//                                         width: 26,
//                                         child: Image.asset(
//                                             'assets/icons/Vector-6.png'))
//                                   ],
//                                 )
//                               ],
//                             ),
//                           )),
//                     ),
//                     const SizedBox(height: 15),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 24, right: 25.99),
//                       child: Divider(),
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Similar Items',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               color: textColor),
//                         ),
//                         Container(
//                           width: 375,
//                           height: 131,
//                           // width: d,
//                           child: Container(
//                             height: 100,
//                             child: ListView.separated(
//                                 // physics:
//                                 //     const NeverScrollableScrollPhysics(),
//                                 scrollDirection: Axis.horizontal,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) => Stack(
//                                       children: [
//                                         Container(
//                                           width: 131,
//                                           height: 98,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10)),
//                                           child: Image.asset(
//                                               'assets/icons/Rectangle 7888.png'),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.center,
//                                           child: Container(
//                                             width: 63,
//                                             height: 20,
//                                             decoration: BoxDecoration(
//                                                 color: textColor,
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             child: Center(
//                                               child: Text(
//                                                 '30 EGP',
//                                                 style: TextStyle(
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                 // Container(
//                                 //   height: 98,
//                                 //   width: 100,
//                                 //   decoration: BoxDecoration(
//                                 //       borderRadius:
//                                 //           BorderRadius.circular(10),
//                                 //       image: DecorationImage(
//                                 //           image: AssetImage(
//                                 //               'assets/icons/Rectangle 7888.png'),
//                                 //           fit: BoxFit.fill)),
//                                 // ),
//                                 separatorBuilder: (context, index) => SizedBox(
//                                       width: 5,
//                                     ),
//                                 itemCount: 10),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//           context: context),
//     );
//   }
// }
