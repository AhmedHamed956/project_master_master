import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Helper {
  static Future<Uint8List?> getBytesFromCanvas(double size, String src) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()
      ..color;
    final double radius = size / 2;
    final Path clipPath = Path();
    clipPath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size, size), const Radius.circular(100)));

    canvas.drawCircle(
        Offset(radius, radius), radius, Paint()
      ..color = Colors.white);

    canvas.clipPath(clipPath);
    final Uint8List imageUint8List =
    (await NetworkAssetBundle(Uri.parse(src)).load(src))
        .buffer
        .asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(imageUint8List);
    final ui.FrameInfo imageFI = await codec.getNextFrame();
    paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(0, 0, size, size),
        image: imageFI.image,
        fit: BoxFit.cover);
    //draw Border
    paint.color = const Color(0xff8869f2);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = size * 0.1;
    canvas.drawCircle(Offset(radius, radius), radius, paint);

    final image = await pictureRecorder
        .endRecording()
        .toImage(size.toInt(), (size * 1.1).toInt());
    final rdata = await image.toByteData(format: ui.ImageByteFormat.png);
    return rdata?.buffer.asUint8List();
  }


}
