import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:memorybox/resources/app_colors.dart';
import 'package:memorybox/repositories/authorization_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: purple,
        backgroundColor: background,
        // textTheme: GoogleFonts.marmeladTextTheme(
        //   Theme.of(context).textTheme,
        // ),
      ),
      home: AuthService().handleAuth(),
    );
  }
}
