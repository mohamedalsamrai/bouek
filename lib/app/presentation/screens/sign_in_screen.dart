import 'package:bouek/app/presentation/providers/registration/registration_cubit.dart';
import 'package:bouek/app/presentation/screens/home_screen.dart';
import 'package:bouek/app/presentation/widgets/sign_in_form.dart';
import 'package:bouek/menu_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        if (state is EmailVerified) {
          return const MenuTabBar();
        }
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SignInForm(),
              ),
            ),
          ),
        );
      },
    );
  }
}
