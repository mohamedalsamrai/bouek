import 'package:bouek/app/presentation/providers/registration/registration_cubit.dart';
import 'package:bouek/app/presentation/di/locator_di.dart';
import 'package:bouek/app/presentation/providers/login/login_cubit.dart';
import 'package:bouek/app/presentation/screens/location_screen.dart';
import 'package:bouek/app/presentation/screens/sign_in_screen.dart';
import 'package:bouek/app/presentation/screens/sign_up_screen.dart';
import 'package:bouek/app/utils/constants/app_theme.dart';
import 'package:bouek/app/utils/methods.dart';
import 'package:bouek/firebase_options.dart';
import 'package:bouek/menu_tab_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inite();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Bouek());
}

class Bouek extends StatelessWidget {
  const Bouek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => s1<RegistrationCubit>(),
        ),
        BlocProvider(create: (context) => s1<LoginCubit>())
      ],
      child: MaterialApp(
        theme: kthemeData,
        title: 'Bouek',
        initialRoute: checkUserState() ? '/menu_tab_bar' : '/sign_up',
        debugShowCheckedModeBanner: false,
        routes: {
          '/menu_tab_bar':(context)=>const MenuTabBar(),
          '/sign_up': (context) => const SignUpScreen(),
          '/home': (context) => const HomeScreen(),
          '/sign_in': (context) => const SignInScreen(),
          '/location': (context) => const LocationScreen(),
        },
      ),
    );
  }
}


