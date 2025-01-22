import 'package:bouek/app/presentation/constants/colors.dart';
import 'package:bouek/app/presentation/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/logo.svg'),
                  const SizedBox(height: 20),
                  const Text('Bouek', style: TextStyle(fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                  const CustomTextFieldWidget(title: 'Email', subtitle: 'Enter email', isPassword: false),
                  const SizedBox(height: 26),
                  const CustomTextFieldWidget(title: 'Password', subtitle: 'Enter password', isPassword: true),
                  const SizedBox(height: 26),
                  const CustomTextFieldWidget(title: 'Confirm Password', subtitle: 'Enter again', isPassword: true),
                  const SizedBox(height: 63),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff065CCB), minimumSize: const Size(double.infinity, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                      child: const Text('Sign Up', style: TextStyle(fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
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
                      const Text('Already have an account? ', style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Sign In', style: TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500, color: primaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
