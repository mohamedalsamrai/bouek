import 'package:bouek/app/presentation/providers/login/login_cubit.dart';
import 'package:bouek/app/presentation/widgets/checkbox.dart';
import 'package:bouek/app/presentation/widgets/custom_blue_button.dart';
import 'package:bouek/app/presentation/widgets/custom_textfield_widget.dart';
import 'package:bouek/app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignInForm extends StatelessWidget {
  SignInForm({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
          ),
          SvgPicture.asset(
            "assets/icons/logo.svg",
          ),
          const SizedBox(height: 20),
          const Text(
            'Bouek',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
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
          const SizedBox(height: 42),
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
          const SizedBox(height: 25),
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
                      fontSize: 16,
                    ),
                  ),
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
              ),
            ],
          ),
          const SizedBox(height: 62),
          CustomBlueButton(
            onPressed: () {
              if (globalKey.currentState!.validate()) {
                final email = emailController.text;
                final password = passwordController.text;
                context
                    .read<LoginCubit>()
                    .loginUser(email: email, password: password);
              }
            },
            title: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginErorr) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                } else if (state is LoginSuccess) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              builder: (context, state) {
                if (state is Logining) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color(0xffffffff),
                    ),
                  );
                }
                return Text('Sign In',
                    style: const TextStyle(
                        fontSize: 19,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white));
              },
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset("assets/icons/google_logo.svg"),
              const SizedBox(width: 100),
              SvgPicture.asset("assets/icons/facebook_logo.svg"),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account? ',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
