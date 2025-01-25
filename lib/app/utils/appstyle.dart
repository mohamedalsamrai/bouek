import 'package:flutter/material.dart';

class Appstyle {
  Color? color;
  Appstyle({
    required this.color,
  });
  static TextStyle semiBold14(context) {
    return const TextStyle(
      fontFamily: "Roboto",
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );
  }
}
