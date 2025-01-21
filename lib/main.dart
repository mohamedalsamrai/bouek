import 'package:bouek/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("WELCOME"),
        ),
      ),
    );
  }
}
