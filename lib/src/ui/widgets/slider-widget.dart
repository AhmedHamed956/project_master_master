import 'package:flutter/material.dart';
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
            // var title = "${S.current.offer} ${S.current.quick}";
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => QuickScreen(
                      // title: title,
                      // type: 'offer',
                      )),
            );
          }
          if (widget.model?.directedTo == 'digital') {
            // var title = "${S.current.offer} ${S.current.digital_gifts}";
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => DigtalScreen(
                      // title: title,
                      // type: 'offer',
                      )),
            );
          }
          // Navigator.pushNamed(context, CompanyScreen.routeName,
          //     arguments: RouteArgument(param: model.company!.id));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              // height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Color(0xfff5f5f5), width: 1.5),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xfff5f5f5),
                        blurRadius: 3,
                        spreadRadius: 3)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  '${domainlink}${widget.model?.image}',
                  fit: BoxFit.fill,
                ),
              )
              //  CachedNetworkImage(

              //     imageUrl: model.image!,
              //     fit: BoxFit.cover,
              //     placeholder: (context, url) => const Center(
              //         heightFactor: 3,
              //         widthFactor: 2,
              //         child: CircularProgressIndicator(
              //             color: mainColorLite, strokeWidth: 1)),
              //     errorWidget: (context, url, error) =>
              //         new Icon(Icons.error, color: mainColorLite)),
              ),
        ));
  }
}
