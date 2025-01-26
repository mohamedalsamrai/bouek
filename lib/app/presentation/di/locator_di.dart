import 'package:bouek/app/presentation/providers/login/login_cubit.dart';
import 'package:bouek/app/presentation/providers/registration/registration_cubit.dart';
import 'package:bouek/app/services/auth_services.dart';
import 'package:bouek/data/repositories/auth_repository_impl.dart';
import 'package:bouek/domain/repositories/auth_repository.dart';
import 'package:bouek/domain/usecases/check_email_verification.dart';
import 'package:bouek/domain/usecases/login_usecase.dart';
import 'package:bouek/domain/usecases/register_user.dart';
import 'package:bouek/domain/usecases/send_email_verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> inite() async {
  s1.registerFactory(
    () => RegistrationCubit(
        registerUser: s1(),
        sendEmailVerification: s1(),
        checkEmailVerification: s1()),
  );
  s1.registerLazySingleton<RegisterUser>(
    () => RegisterUser(s1()),
  );
  s1.registerLazySingleton<SendEmailVerification>(
    () => SendEmailVerification(s1()),
  );
  s1.registerLazySingleton<CheckEmailVerification>(
    () => CheckEmailVerification(s1()),
  );
  s1.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  s1.registerLazySingleton(
    () => AuthServices(auth: s1()),
  );
  s1.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(s1()),
  );
  s1.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(s1()),
  );
  s1.registerFactory(
    () => LoginCubit(loginUsecase: s1()),
  );
}
