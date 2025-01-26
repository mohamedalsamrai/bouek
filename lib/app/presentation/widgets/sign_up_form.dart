import 'package:bouek/app/presentation/providers/registration/registration_cubit.dart';
import 'package:bouek/app/presentation/widgets/custom_blue_button.dart';
import 'package:bouek/app/presentation/widgets/custom_textfield_widget.dart';
import 'package:bouek/app/presentation/widgets/email_verification_dialog.dart';
import 'package:bouek/app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
  });

  final GlobalKey<FormState> globalKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SvgPicture.asset('assets/icons/logo.svg'),
          const SizedBox(height: 20),
          const Text('Bouek',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600)),
          CustomTextFieldWidget(
            title: 'Email',
            subtitle: 'Enter email',
            isPassword: false,
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 26),
          CustomTextFieldWidget(
            title: 'Password',
            subtitle: 'Enter password',
            isPassword: true,
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 26),
          CustomTextFieldWidget(
            title: 'Confirm Password',
            subtitle: 'Enter again',
            isPassword: true,
            controller: confirmPasswordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your confirm password';
              }
              return null;
            },
          ),
          const SizedBox(height: 63),
          CustomBlueButton(
            title: BlocConsumer<RegistrationCubit, RegistrationState>(
              listener: (context, state) {
                 if (state is RegistrationSuccess) {
          //show email verification dialog
          showDialog(
            context: context,
            builder: (context) => const EmailVerificationDialog(),
          );
        } else if (state is RegistrationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
              },
              builder: (context, state) {
                if (state is RegistrationLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xffffffff),
                    ),
                  );
                }
                return const Text('Sign In',
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white));
              },
            ),
            onPressed: () {
              if (globalKey.currentState!.validate()) {
                final email = emailController.text;
                final password = passwordController.text;
                context.read<RegistrationCubit>().register(email, password);
              }
            },
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/icons/google_logo.svg'),
                SvgPicture.asset('assets/icons/facebook_logo.svg'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account? ',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500)),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_in');
                },
                child: const Text('Sign In',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: primaryColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
