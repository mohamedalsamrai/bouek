import 'package:bouek/app/presentation/screens/sign_in_screen.dart';
import 'package:bouek/app/presentation/screens/sign_up_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Bouek',
      initialRoute: '/sign_in',
      routes: {
        // '/': (context) => const Bouek(),
        '/sign_up': (context) => const SignUpScreen(),
        '/sign_in': (context) => const SignInScreen()
      },
    );
  }
}
