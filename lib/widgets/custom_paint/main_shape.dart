import 'package:flutter/material.dart';
import 'package:memorybox/resources/app_colors.dart';

// class CurvePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint();
//     paint.color = purple;
//     paint.style = PaintingStyle.fill;

//     var path = Path();

//     path.moveTo(size.width * -0.2062034, size.height * 0.5088753);
//     path.cubicTo(
//         size.width * 0.1448551,
//         size.height * 0.9881653,
//         size.width * 1.299906,
//         size.height * 1.127659,
//         size.width * 1.469505,
//         size.height * 0.2949404);
//     path.lineTo(size.width, 0);
//     path.lineTo(0, 0);

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = purple;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.30);
    path.quadraticBezierTo(
        size.width / 2.2, size.height / 2, size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
