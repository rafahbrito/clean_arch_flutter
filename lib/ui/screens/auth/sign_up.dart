import 'package:clean_arch_flutter/core/configs/navigation/app_navigation.dart';
import 'package:clean_arch_flutter/data/models/auth/signup_request_params.dart';
import 'package:clean_arch_flutter/domain/usecases/auth/signup.dart';
import 'package:clean_arch_flutter/service_locator.dart';
import 'package:clean_arch_flutter/ui/screens/auth/sign_in.dart';
import 'package:clean_arch_flutter/ui/screens/home/home.dart';
import 'package:clean_arch_flutter/ui/widgets/async_button/button.dart';
import 'package:clean_arch_flutter/ui/widgets/snackbar_error/snackbar_error.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _signUpText(),
            SizedBox(height: 30),
            _emailField(),
            SizedBox(height: 20),
            _passwordField(),
            SizedBox(height: 60),
            AsyncButton(
              title: "Criar",
              onPressed:
                  () async => sl<SignupUseCase>().execute(
                    params: SignupRequestParams(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
              onSuccess: () {
                AppNavigator.pushAndRemove(context, HomeScreen());
              },
              onFailure: (error) {
                SnackbarError.errorMessage(error, context);
              },
            ),
            SizedBox(height: 20),
            _signInText(context),
          ],
        ),
      ),
    );
  }

  Widget _signUpText() {
    return Text(
      "Criar Conta",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.visibility),
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Já possui uma conta? "),
          TextSpan(
            text: "Entrar",
            style: TextStyle(color: Colors.blueAccent),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SignInScreen());
                  },
          ),
        ],
      ),
    );
  }
}
