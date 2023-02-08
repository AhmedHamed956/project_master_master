import 'package:flutter/material.dart';
import 'package:image_pixels/image_pixels.dart';
import 'package:project/Models/Ads_Model.dart';
import 'package:project/src/ui/Shared/constant.dart';

import '../navigation_screen/main-screens/digital-Screens/digital-Screen.dart';
import '../navigation_screen/main-screens/quick-screen.dart';

class SliderWidget extends StatefulWidget {
  AdsData? model;

  SliderWidget({Key? key, this.model});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if (widget.model?.directedTo == 'quick') {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => QuickScreen()));
          }
          if (widget.model?.directedTo == 'digital') {
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const DigtalScreen()),
            );
          }
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Container(
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xffe0e0e0),
                          blurRadius: 7,
                          spreadRadius: 7)
                    ]),
                child: ImagePixels.container(
                    imageProvider:
                        NetworkImage('$domainlink${widget.model?.image}'),
                    colorAlignment: Alignment.topLeft,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          '$domainlink${widget.model?.image}',
                        ))))));
  }
}
