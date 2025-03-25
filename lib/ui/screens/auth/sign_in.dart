import 'package:clean_arch_flutter/core/configs/navigation/app_navigation.dart';
import 'package:clean_arch_flutter/data/models/auth/signin_request_params.dart';
import 'package:clean_arch_flutter/domain/usecases/auth/signin.dart';
import 'package:clean_arch_flutter/service_locator.dart';
import 'package:clean_arch_flutter/ui/screens/auth/sign_up.dart';
import 'package:clean_arch_flutter/ui/screens/home/home.dart';
import 'package:clean_arch_flutter/ui/widgets/async_button/button.dart';
import 'package:clean_arch_flutter/ui/widgets/snackbar_error/snackbar_error.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInScreen({super.key});

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
              onPressed:
                  () async => sl<SigninUseCase>().execute(
                    params: SigninRequestParams(
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
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
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
