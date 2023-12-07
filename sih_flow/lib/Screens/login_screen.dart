import 'package:flutter/material.dart';
import 'package:sih_flow/Screens/category.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login screen")),
      ),
      
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'App Logo',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Center(
            child: Text(
              'Email',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Password',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Center(
            child: Text(
              'Google',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Facebook',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              'Sign up with number',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CategoryScreen.id);
        },
        child: const Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
