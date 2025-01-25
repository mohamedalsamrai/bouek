import 'package:bouek/app/presentation/widgets/checkbox.dart';
import 'package:bouek/app/presentation/widgets/custom_blue_button.dart';
import 'package:bouek/app/presentation/widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bouek/app/utils/constants/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(top: 50),
                          child: SvgPicture.asset("assets/icons/logo.svg")),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Bouek',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600)),
                      const Spacer(),
                      const CustomTextFieldWidget(
                          title: "Email",
                          subtitle: "Enter email",
                          isPassword: false),
                      const SizedBox(
                        height: 30,
                      ),
                      const CustomTextFieldWidget(
                          title: "Password",
                          subtitle: "Enter password",
                          isPassword: true),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Row(
                            children: [
                              SizedBox(child: CustomCheckBox()),
                              Text(
                                "Remember",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password? ",
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomBlueButton(
                        title: "Sign In",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/google_logo.svg"),
                          const SizedBox(
                            width: 100,
                          ),
                          SvgPicture.asset("assets/icons/facebook_logo.svg"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                      const SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
