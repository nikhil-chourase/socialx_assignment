import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialx/screens/login_screen.dart';
import 'package:socialx/screens/news_screen.dart';
import 'package:socialx/screens/sign_up_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id :(context)=> LoginScreen(),
        SignUpScreen.id :(context) => SignUpScreen(),
        NewsScreen.id : (context) => NewsScreen(),

      },
    );
  }
}
