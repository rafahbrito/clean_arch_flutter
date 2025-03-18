import 'package:clean_arch_flutter/core/configs/assets/app_images.dart';
import 'package:clean_arch_flutter/core/configs/navigation/app_navigation.dart';
import 'package:clean_arch_flutter/ui/screens/auth/sign_in.dart';
import 'package:clean_arch_flutter/ui/screens/home/home.dart';
import 'package:clean_arch_flutter/ui/screens/splash/bloc/splash_cubit.dart';
import 'package:clean_arch_flutter/ui/screens/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            AppNavigator.pushReplacement(context, SignInScreen());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, HomeScreen());
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.splashBg)),
          ),
        ),
      ),
    );
  }
}
