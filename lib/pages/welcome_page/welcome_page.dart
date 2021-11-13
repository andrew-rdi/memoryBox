import 'package:flutter/material.dart';
import 'package:memorybox/pages/login_page/login_page.dart';
import 'package:memorybox/repositories/authorization_repository.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/widgets/custom_paint/main_shape.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                  'MemoryBox',
                  style: TextStyle(
                    color: background,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 155, right: 50),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Твой голос всегдя рядом',
                  style: TextStyle(
                    color: background,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 310),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Привет!',
                  style: TextStyle(
                    color: black,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 360),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Мы рады видеть тебя здесь.'
                  '\nЭто приложение поможет записывать'
                  '\nсказки и держать их в удобном месте не'
                  '\nзаполняя память на телефоне',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.only(top: 480),
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1.0,
                    primary: rose,
                    padding: const EdgeInsets.all(18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text(
                    'Продолжить',
                    style: TextStyle(
                      color: background,
                      fontSize: 18.0,
                    ),
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
