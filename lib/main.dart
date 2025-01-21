import 'package:flutter/material.dart';

void main() {
  runApp(const Bouek());
}

class Bouek extends StatefulWidget {
  const Bouek({super.key});

  @override
  State<Bouek> createState() => _BouekState();
}

class _BouekState extends State<Bouek> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Container(),
      ),
    );  
  }
}
