import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_signInText(), _emailField()],
        ),
      ),
    );
  }

  Widget _signInText() {
    return Text(
      "Entrar",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
    );
  }

  Widget _emailField() {
    return TextField(decoration: InputDecoration(hintText: 'Email'));
  }
}
