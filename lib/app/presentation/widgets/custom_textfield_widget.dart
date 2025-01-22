import 'package:bouek/app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isPassword,
    this.controller,
  });

  final String title;
  final String subtitle;
  final bool isPassword;
  final TextEditingController? controller;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.title, style: const TextStyle(fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        TextField(
          controller: widget.controller,
          cursorColor: primaryColor,
          obscureText: !_isPasswordVisible && widget.isPassword,
          decoration: InputDecoration(
            hintText: widget.subtitle,
            suffixIconConstraints: const BoxConstraints(minWidth: 40),
            suffixIcon: widget.isPassword ? _toggleVisible() : null,
            hintStyle: const TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w500, color: Color(0xffAEAEB4)),
            border: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE5E5E5)), borderRadius: BorderRadius.all(Radius.circular(16))),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: primaryColor), borderRadius: BorderRadius.all(Radius.circular(16))),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE5E5E5)), borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
        ),
      ],
    );
  }

  InkWell _toggleVisible() {
    if (_isPasswordVisible) {
      return InkWell(
        onTap: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
        child: SvgPicture.asset('assets/icons/open_eye.svg'),
      );
    } else {
      return InkWell(
        onTap: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
        child: SvgPicture.asset('assets/icons/close_eye.svg'),
      );
    }
  }
}
