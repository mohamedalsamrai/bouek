import 'package:flutter/material.dart';

class CustomBlueButton extends StatelessWidget {
  const CustomBlueButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff065CCB),
        minimumSize: Size(
          MediaQuery.of(context).size.width - 30.0,
          50,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(title, style: const TextStyle(fontSize: 19, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
