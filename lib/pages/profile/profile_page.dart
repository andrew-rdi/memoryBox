import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memorybox/pages/profile/components/user_image.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/widgets/custom_paint/main_shape.dart';
import 'package:memorybox/repositories/authorization_repository.dart';

import 'package:image_cropper/image_cropper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfilegState createState() => _ProfilegState();
}

class _ProfilegState extends State<Profile> {
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomPaint(
        painter: CurvePainter(),
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Профиль',
                      style: TextStyle(
                        color: background,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Твоя частичка',
                    style: TextStyle(
                      color: background,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                UserImage(onFileChanged: (imageUrl) {
                  setState(() {
                    this.imageUrl = imageUrl;
                  });
                }),
                // Card(
                //   color: background.withOpacity(0.8),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: InkWell(
                //     splashColor: background,
                //     onTap: () {
                //       print('Card tapped.');
                //     },
                //     child: const SizedBox(
                //       width: 170,
                //       height: 170,
                //       child: Center(
                //         child: Center(),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 15),
                const Text(
                  'User Name',
                  style: TextStyle(
                    color: black,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: size.width * 0.8,
                  child: const Material(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    elevation: 8,
                    shadowColor: background,
                    child: TextField(
                      //controller: _otp,
                      //keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 3,
                        color: black,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: background,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Редоктировать',
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Подписка',
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(right: 30, left: 30),
                  width: 250,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: black),
                  ),
                  child: const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: 0.3,
                      valueColor: AlwaysStoppedAnimation<Color>(rose),
                      backgroundColor: background,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '150/500 мб',
                  style: TextStyle(
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () {
                            AuthService().signOut(context);
                          },
                          child: const Text(
                            'Выйти из приложения',
                            style: TextStyle(
                              color: black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Удалить аккаунт',
                            style: TextStyle(
                              color: red,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
