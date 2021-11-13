// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memorybox/repositories/authorization_repository.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/widgets/custom_paint/main_shape.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  late String phoneNo;
  late String verificationId;
  late String smsCode;

  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomPaint(
        painter: CurvePainter(),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Регистрация',
                  style: TextStyle(
                    color: background,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  codeSent
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 260),
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Введи код из смс, чтобы мы'
                                '\nтебя запомнили',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              width: size.width * 0.8,
                              child: Material(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                elevation: 8,
                                shadowColor: background,
                                child: TextFormField(
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        smsCode = val;
                                      },
                                    );
                                  },
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 3,
                                    color: black,
                                  ),
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(90.0)),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: background,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                padding: const EdgeInsets.only(top: 30),
                                width: size.width * 0.8,
                                child: ElevatedButton(
                                  onPressed: buttonAction,
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
                            const SizedBox(height: 60),
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
                                'Регистрация привяжет твои сказки'
                                '\nк облаку, после чего они всегда'
                                '\nбудут с тобой',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 280),
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                'Введи номер телефона',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: size.width * 0.8,
                              child: Material(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                elevation: 8,
                                shadowColor: background,
                                child: TextFormField(
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        phoneNo = val;
                                      },
                                    );
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 3,
                                    color: black,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(90.0)),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: background,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                width: size.width * 0.8,
                                child: ElevatedButton(
                                  onPressed: buttonAction,
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
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topCenter,
                              child: TextButton(
                                onPressed: () async {
                                  AuthService().signInAnonymously();
                                },
                                child: const Text(
                                  'Позже',
                                  style: TextStyle(
                                    color: black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
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
                                'Регистрация привяжет твои сказки'
                                '\nк облаку, после чего они всегда'
                                '\nбудут с тобой',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  void buttonAction() {
    codeSent
        ? AuthService().signInWithOTP(smsCode, verificationId)
        : verifyPhone(phoneNo);
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      verificationId = verId;
      setState(
        () {
          codeSent = true;
        },
      );
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 2),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

}
