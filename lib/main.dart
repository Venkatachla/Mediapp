import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_age.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'pages/forgotpas.dart';
import 'pages/signinpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(name: ''), 

        MyRoutes.homeRoute: (context) => HomePage(name: ''), 
        MyRoutes.forpassRoute: (context) => ForgotpasswordPage(), 
        MyRoutes.signinRoute: (context) => Signinpage(),
        MyRoutes.loginRoute :(context) => LoginPage(),
      },
    );
  }
}
