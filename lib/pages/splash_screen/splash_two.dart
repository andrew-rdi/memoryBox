import 'dart:async';
import 'package:flutter/material.dart';
import 'package:memorybox/pages/navigation.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/widgets/custom_paint/main_shape.dart';
import 'package:memorybox/widgets/custom_paint/heart_shape.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>  const NavigationScreen())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomPaint(
        painter: CurvePainter(),
        child: Stack(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Ты супер!',
                  style: TextStyle(
                    color: background,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 8.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: background,
                  ),
                  child: const Text(
                    'Мы рады тебя видеть',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: black,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: CustomPaint(
                    size: const Size(70, 70),
                    painter: HeartPainter(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
