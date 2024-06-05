// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoezo3/main.dart';
import 'package:shoezo3/widgets/bottom_nav.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void loginFunction(BuildContext context) async {
    final userName = usernameController.text.trim();
    final passWord = passwordController.text.trim();

    if (userName == 'hello' && passWord == '123') {
      final sharedpref = await SharedPreferences.getInstance();
      await sharedpref.setBool(saveKey, true);

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Incorrect username or password'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 100),
                    Icon(Icons.lock, size: 100),
                    SizedBox(height: 30),
                    Text('Welcome Back',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Text('Enter your email and password'),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginFunction(context);
                        }
                      },
                      icon: Icon(
                        Icons.lock_open,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
