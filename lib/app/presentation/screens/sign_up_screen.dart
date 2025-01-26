import 'package:bouek/app/presentation/providers/registration/registration_cubit.dart';
import 'package:bouek/app/presentation/screens/home_screen.dart';
import 'package:bouek/app/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        if (state is EmailVerified) {
          return const HomeScreen();
        }
        return Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SignUpForm(),
              ),
            ),
          ),
        );
      },
    );
  }
}
