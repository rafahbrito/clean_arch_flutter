import 'package:clean_arch_flutter/ui/widgets/async_button/bloc/button_cubit.dart';
import 'package:clean_arch_flutter/ui/widgets/async_button/bloc/button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsyncButton extends StatelessWidget {
  final Future Function() onPressed;
  final VoidCallback onSuccess;
  final Function(String error) onFailure;
  final String? title;
  final double? height;
  final double? width;
  final Color? activeColor;

  const AsyncButton({
    super.key,
    required this.onPressed,
    required this.onSuccess,
    required this.onFailure,
    this.title,
    this.height,
    this.width,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocConsumer<ButtonCubit, ButtonState>(
        builder: (context, state) {
          if (state is ButtonLoadingState) {
            return _loading(context);
          }
          return _inital(context);
        },
        listener:
            (context, state) => {
              if (state is ButtonSuccessState)
                {onSuccess()}
              else if (state is ButtonFailureState)
                {onFailure(state.errorMessage)},
            },
      ),
    );
  }

  Widget _inital(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<ButtonCubit>().execute(onPressed);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: activeColor ?? const Color(0xff3461FD),
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 60,
        ),
      ),
      child: Text(
        title ?? 'Entrar',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.grey,
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 60,
        ),
      ),
      child: CircularProgressIndicator(color: Colors.white),
    );
  }
}
