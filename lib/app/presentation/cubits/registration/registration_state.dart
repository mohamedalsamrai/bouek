part of 'registration_cubit.dart';

abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String successMessage;
  RegistrationSuccess(this.successMessage);
}

class RegistrationFailure extends RegistrationState {
  final String errorMessage;

  RegistrationFailure(this.errorMessage);
}

class RegistrationVerificationSent extends RegistrationState {}

class EmailVerified extends RegistrationState {}

class EmailNotVerified extends RegistrationState {}
