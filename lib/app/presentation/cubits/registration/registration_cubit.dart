import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bouek/domain/usecases/check_email_verification.dart';
import 'package:bouek/domain/usecases/register_user.dart';
import 'package:bouek/domain/usecases/send_email_verification.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final RegisterUser registerUser;
  final SendEmailVerification sendEmailVerification;
  final CheckEmailVerification checkEmailVerification;

  Timer? _emailCheckTimer;

  RegistrationCubit(
      {required this.registerUser, required this.sendEmailVerification,
      required this.checkEmailVerification
      })
      : super(RegistrationInitial());

  Future<void> register(String email, String password) async {
    emit(RegistrationLoading());

    try {
      await registerUser.execute(email, password);
      emit(RegistrationSuccess('Successfully registered'));

      // Send email verification after registration
      await sendEmailVerification.execute();

      // Start checking for email verification status
      _checkEmailVerification();
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }

  // Method to start polling for email verification status
  void _checkEmailVerification() {
    _emailCheckTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      bool emailVerified = await checkEmailVerification.execute();

      if (emailVerified) {
        _emailCheckTimer?.cancel();
        emit(EmailVerified());
      } else {
        emit(EmailNotVerified());
      }
    });
  }

  @override
  Future<void> close() {
    _emailCheckTimer?.cancel(); // Clean up timer when cubit is closed
    return super.close();
  }
}
