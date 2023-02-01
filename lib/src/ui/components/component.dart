import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/generated/l10n.dart';

import '../Shared/constant.dart';

Widget ingridentbutton(
        {double? width,
        double? height,
        String? text,
        required VoidCallback function,
        required Color color1,
        required Color color2}) =>
    Container(
      width: width,
      height: height,
      // ignore: sort_child_properties_last
      child: MaterialButton(
          // ignore: sort_child_properties_last
          child: Text(
            text!,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(15.0),
          // ),
          onPressed: function),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color2, color1])),
    );

Widget defultbutton({
  double? width,
  double? height,
  String? text,
  required VoidCallback function,
  Color? color,
}) =>
    Container(
      width: width,
      height: height,

      // ignore: sort_child_properties_last
      child: MaterialButton(
          child: Text(
            text!,
            style: const TextStyle(color: button1color, fontSize: 16),
          ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(15.0),
          // ),
          onPressed: function),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(4), color: color),
    );

Widget defaulttextfield(
        {required TextEditingController controller,
        required TextInputType type,
        bool? ispromocode,
        bool isQuickSearch = false,
        bool isPassword = false,
        VoidCallback? ontap,
        ValueChanged? onsmuit,
        ValueChanged? onchanged,
        Function? validator,
        String? label,
        String? hinttext,
        IconData? prefix,
        IconData? suffix,
        Color? iconColor,
        VoidCallback? suffixpressed,
        double? fontsize,
        Color? fontColor}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onsmuit,
      onChanged: onchanged,
      onTap: ontap,
      // validator: validator,

      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(
              fontSize: fontsize,
              color: textColor,
              fontWeight: FontWeight.w500),
          labelText: label,
          prefixIcon: prefix != null
              ? ispromocode == true
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: maingradientColor),
                        child: Center(
                            child: Text(
                          S.current.apply,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )),
                      ),
                    )
                  : Icon(
                      prefix,
                      color: iconColor,
                    )
              : null,
          suffixIcon: suffix != null
              ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
              : null,
          border: isQuickSearch
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(color: textFieldColor))),
    );

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon,
    this.size,
    this.gradient,
  );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Basic dialog title'),
        content: const Text('A dialog is a type of modal window that\n'
            'appears in front of app content to\n'
            'provide critical information, or prompt\n'
            'for a decision to be made.'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
