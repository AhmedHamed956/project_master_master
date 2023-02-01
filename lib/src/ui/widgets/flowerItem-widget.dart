// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:project/Models/shop_details_Model.dart';

// import '../../../generated/l10n.dart';
// import '../Cart_Shops/Add_To_Cart.dart';
// import '../Shared/constant.dart';

// class FlowerWidget extends StatefulWidget {
//   FlowerWidget({
//     super.key,
//   });

//   @override
//   State<FlowerWidget> createState() => _FlowerWidgetState();
// }

// class _FlowerWidgetState extends State<FlowerWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         showModalBottomSheet(
//             isScrollControlled: true,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             backgroundColor: Colors.white,
//             builder: (BuildContext context) {
//               return FractionallySizedBox(
//                 heightFactor: 0.9,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 220,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10)),
//                           color: Colors.grey,
//                           image: DecorationImage(
//                             fit: BoxFit.fill,
//                             image: AssetImage(
//                                 "assets/icons/Rectangle 7863-2 2.png"),
//                           ),
//                         ),
//                         // child:
//                         //     Image.asset('assets/icons/Rectangle 7863-2 2.png'),
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.only(
//                               top: 25, left: 23, right: 23),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                     child: Text(
//                                   ' Gerberas and Lilies: عالم الأحلام',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.w700,
//                                       color: textColor),
//                                   // maxLines: 1,
//                                 )),
//                                 Text(
//                                   '41,00 ${S.current.rs}',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700,
//                                       color: indicatorColor),
//                                 ),
//                               ])),
//                       Padding(
//                           padding: const EdgeInsets.only(left: 30, right: 23),
//                           child: Row(children: [
//                             Text(' 55,00 ${S.current.rs}',
//                                 style: TextStyle(
//                                     decoration: TextDecoration.lineThrough,
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.w400,
//                                     color: textColor))
//                           ])),
//                       const SizedBox(height: 9),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 23, right: 23),
//                         child: Container(
//                           height: 71,
//                           width: 377,
//                           child: const Text(
//                             "يمكن عرض وصف العنصر هنا يمكن عرض وصف العنصر هنا يمكن عرض وصف العنصر هنا ويمكن عرض وصف العنصر هنا ويمكن عرض وصف العنصر هنا",
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: textColor),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 24),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 8, vertical: 8),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(4),
//                                   gradient: quickButton),
//                               child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       S.current.quick_order,
//                                       style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w400,
//                                           color: Colors.white),
//                                     ),
//                                   ]),
//                             ),
//                             const SizedBox(
//                               width: 12,
//                             ),
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 8, vertical: 8),
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(4),
//                                   gradient: const LinearGradient(
//                                       begin: Alignment.topRight,
//                                       end: Alignment.bottomLeft,
//                                       colors: [button2color, button1color])),
//                               child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       // height: 20,
//                                       // width: 20,
//                                       child: SvgPicture.asset(
//                                         'assets/icons/home/Vector-4.svg',
//                                         height: 20,
//                                         width: 20,
//                                       ),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     Text(
//                                       S.current.schedule_an_order,
//                                       style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w400,
//                                           color: Colors.white),
//                                     ),
//                                   ]),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 21,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 13, right: 16),
//                         child: Container(
//                           width: 399,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(
//                                 color: lighttextColor,
//                                 width: 1,
//                               )),
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 19.5, right: 18),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   'اسم متجر البائع',
//                                   style: TextStyle(
//                                       color: textColor,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                                 Row(
//                                   // mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Container(
//                                       height: 18.3,
//                                       width: 29,
//                                       child: const Text(
//                                         "${'(4.8)'}",
//                                         style: TextStyle(
//                                             color: textColor,
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 9,
//                                     ),
//                                     Container(
//                                       height: 11,
//                                       width: 14.25,
//                                       child: SvgPicture.asset(
//                                         'assets/icons/home/Vector-3.svg',
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 11,
//                                       width: 14.25,
//                                       child: SvgPicture.asset(
//                                         'assets/icons/home/Vector-2.svg',
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 11,
//                                       width: 14.25,
//                                       child: SvgPicture.asset(
//                                         'assets/icons/home/Vector-2.svg',
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 11,
//                                       width: 14.25,
//                                       child: SvgPicture.asset(
//                                         'assets/icons/home/Vector-2.svg',
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 11,
//                                       width: 14.25,
//                                       child: SvgPicture.asset(
//                                         'assets/icons/home/Vector-2.svg',
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 28, right: 34),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const AddToCart()));
//                           },
//                           child: Container(
//                               height: 45,
//                               width: 366,
//                               decoration: const BoxDecoration(
//                                   gradient: LinearGradient(
//                                       begin: Alignment.topRight,
//                                       end: Alignment.bottomLeft,
//                                       colors: [button2color, button1color])),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 12, right: 12),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         SvgPicture.asset(
//                                           'assets/icons/home/cart_ic.svg',
//                                           height: 15.0,
//                                           width: 26.0,
//                                           // allowDrawingOutsideViewBox: true,
//                                         ),
//                                         // Container(
//                                         //     height: 15,
//                                         //     width: 26,
//                                         //     child: Image.asset(
//                                         //         'assets/icons/Vector-6.png')),
//                                         const SizedBox(
//                                           width: 5,
//                                         ),
//                                         Text(
//                                           S.current.add_to_basket,
//                                           style: const TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.white),
//                                         ),
//                                       ],
//                                     ),
//                                     Text(
//                                       '41,00 ${S.current.rs}',
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500,
//                                           color: Colors.white),
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       const Padding(
//                         padding: EdgeInsets.only(left: 24, right: 25.99),
//                         child: Divider(),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             S.current.similar_items,
//                             style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: textColor),
//                           ),
//                           Container(
//                             width: 375,
//                             height: 100,
//                             // width: d,
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
//                                           alignment: Alignment.bottomCenter,
//                                           child: Container(
//                                             width: 63,
//                                             height: 20,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.transparent
//                                                     .withOpacity(0.4),
//                                                 borderRadius:
//                                                     BorderRadius.circular(10)),
//                                             child: Center(
//                                               child: Text(
//                                                 '30 ${S.current.rs}',
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
//                                 separatorBuilder: (context, index) =>
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                 itemCount: 10),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             context: context);
//       },
//       child: Container(
//         width: 378.01,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 21),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'aaaaa',
//                     style: TextStyle(
//                         color: textColor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   const Text(
//                     'يمكن عرض وصف العنصر هنا',
//                     style: TextStyle(
//                         color: textColor,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   const Text(
//                     'يمكن عرض وصف العنصر هنا',
//                     style: TextStyle(
//                         color: textColor,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400),
//                   ),
//                   const SizedBox(
//                     height: 13,
//                   ),
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             if (selected == false) {
//                               selected = true;
//                             } else {
//                               selected = false;
//                             }
//                           });

//                           // setState(() {
//                           //   selected = true;
//                           // });
//                         },
//                         child: Container(
//                           width: 70,
//                           height: 20,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: borderColor),
//                             color: selected ? button1color : Colors.white,
//                           ),
//                           child: Center(
//                               child: Text(
//                             '41,00 ${S.current.rs}',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: selected ? Colors.white : borderColor),
//                           )),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Text(' 55,00 ${S.current.rs}',
//                           style: TextStyle(
//                               decoration: TextDecoration.lineThrough,
//                               fontSize: 11,
//                               fontWeight: FontWeight.w400,
//                               color: textColor))
//                       // Container(
//                       //   decoration: BoxDecoration(
//                       //       color: shopCloseColorLite,
//                       //       borderRadius:
//                       //           BorderRadius.circular(10)),
//                       //   child: Text('aaaaaa'),
//                       // ),
//                       // Text('aaaaaa'),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 22),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 height: 111,
//                 width: 136,
//                 child: Image.asset('assets/icons/Rectangle 7863-2.png'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
