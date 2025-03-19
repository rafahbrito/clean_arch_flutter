import 'package:clean_arch_flutter/core/configs/navigation/app_navigation.dart';
import 'package:clean_arch_flutter/ui/screens/auth/sign_up.dart';
import 'package:clean_arch_flutter/ui/widgets/async_button/button.dart';
import 'package:flutter/gestures.dart';
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
          children: [
            _signInText(),
            SizedBox(height: 30),
            _emailField(),
            SizedBox(height: 20),
            _passwordField(),
            SizedBox(height: 60),
            AsyncButton(
              onPressed: () async {},
              onSuccess: () {},
              onFailure: (error) {},
            ),
            SizedBox(height: 20),
            _signUpText(context),
          ],
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
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
      ),
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Não possui uma conta? "),
          TextSpan(
            text: "Criar",
            style: TextStyle(color: Colors.blueAccent),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SignUpScreen());
                  },
          ),
        ],
      ),
    );
  }
}
