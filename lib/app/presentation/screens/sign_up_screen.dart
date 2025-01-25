import 'package:bouek/app/presentation/cubits/registration/registration_cubit.dart';
import 'package:bouek/app/utils/constants/colors.dart';
import 'package:bouek/app/presentation/widgets/custom_blue_button.dart';
import 'package:bouek/app/presentation/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationSuccess) {
          //show email verification dialog
          showDialog(
            context: context,
            builder: (context) => emailVerificationDialog(context),
          );
        } else if (state is RegistrationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        } else if (state is EmailVerified) {
          // ScaffoldMessenger.of(context).clearSnackBars();
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is EmailNotVerified) {
          // ScaffoldMessenger.of(context).clearSnackBars();
          // Show a dialog or message to inform user to verify their email
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Please verify your email')),
          // );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: signUpForm(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpForm(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            title: 'Sign Up',
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
                  // TODO: Implement sign in functionality
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

  // Function to show the "Verify Email" dialog
  Widget emailVerificationDialog(BuildContext cx) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: double.infinity,
        height: 350,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/email.svg'),
            const SizedBox(height: 25),
            const Text(
              'Verify e-mail address',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please verify your email address. A verification link has been sent to your email. Click on the link to complete the verification process.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(cx).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
