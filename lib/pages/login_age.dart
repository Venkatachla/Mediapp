// lib/pages/login_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/forgotpas.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/signinpage.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool onchanged = false;
  final _formkey = GlobalKey<FormState>();

  // Updated method to pass the 'name' parameter to HomePage
  Future<void> MoveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        onchanged = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(name: name),
        ),
      );
      setState(() {
        onchanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
                height: 400,
                width: 700,
              ),
              SizedBox(height: 40),
              Text(
                "sign-in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Text(
                "Welcome, $name",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 62.0, horizontal: 180.0),
                child: Column(
                  children: [
                    TextFormField(
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        labelText: "user name",
                        hintText: "enter user name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter user name";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "password",
                        hintText: "password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter password";
                        }
                        if (value.length < 8) {
                          return "password length must be greater than 8";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(onchanged ? 60 : 12),
                      child: InkWell(
                        onTap: () => MoveToHome(context), // Corrected function call
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          alignment: Alignment.center,
                          height: 60,
                          width: onchanged ? 60 : 120,
                          child: onchanged
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Log-in",
                                  style: TextStyle(
                                    fontSize: 29,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ForgotpasswordPage()),
                              );
                            },
                            child: Text(
                              'Forgot password??',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 800),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Signinpage()),
                              );
                            },
                            child: Text(
                              "Don't have an account \n sign in",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                              ),
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
      ),
    );
  }
}
