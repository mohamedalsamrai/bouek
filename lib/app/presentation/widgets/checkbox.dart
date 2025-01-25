import 'package:flutter/material.dart';
import 'package:bouek/app/utils/constants/colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: primaryColor,
        value: value,
        onChanged: (bool? newvalue) {
          setState(() {
            value = newvalue;
          });
        });
  }
}
