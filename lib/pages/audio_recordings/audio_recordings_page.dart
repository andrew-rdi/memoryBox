import 'package:flutter/material.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/widgets/custom_paint/main_shape.dart';

class AudioRecordings extends StatelessWidget {
  const AudioRecordings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: CurvePainter(),
        child: Stack(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Audio Recordings',
                  style: TextStyle(
                    color: background,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    //интервал между букв
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
