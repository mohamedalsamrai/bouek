import 'package:bouek/app/presentation/cubits/registration/registration_cubit.dart';
import 'package:bouek/app/presentation/screens/sign_up_screen.dart';
import 'package:bouek/data/repositories/auth_repository_impl.dart';
import 'package:bouek/domain/usecases/check_email_verification.dart';
import 'package:bouek/domain/usecases/register_user.dart';
import 'package:bouek/domain/usecases/send_email_verification.dart';
import 'package:bouek/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Create instances
  final authRepository = AuthRepositoryImpl(FirebaseAuth.instance);
  final registerUserUseCase = RegisterUser(authRepository);
  final sendEmailVerificationUseCase = SendEmailVerification(authRepository);
  final checkEmailVerificationUseCase = CheckEmailVerification(authRepository);

  runApp(Bouek(
    registerUserUseCase: registerUserUseCase,
    sendEmailVerificationUseCase: sendEmailVerificationUseCase,
    checkEmailVerificationUseCase: checkEmailVerificationUseCase,
  ));
}

class Bouek extends StatelessWidget {
  final RegisterUser registerUserUseCase;
  final SendEmailVerification sendEmailVerificationUseCase;
  final CheckEmailVerification checkEmailVerificationUseCase;

  const Bouek({
    super.key,
    required this.registerUserUseCase,
    required this.sendEmailVerificationUseCase,
    required this.checkEmailVerificationUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegistrationCubit(
            registerUser: registerUserUseCase,
            sendEmailVerification: sendEmailVerificationUseCase,
            checkEmailVerification: checkEmailVerificationUseCase,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Bouek',
        initialRoute: '/sign_up',
        debugShowCheckedModeBanner: false,
        routes: {
          '/sign_up': (context) => SignUpScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
