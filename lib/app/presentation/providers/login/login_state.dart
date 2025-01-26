part of 'login_cubit.dart';

sealed class LoginState {
  const LoginState();
}

final class LoginInitial extends LoginState {
  const LoginInitial();
}

final class Logining extends LoginState {
  const Logining();
}

final class LoginSuccess  extends LoginState{
  const LoginSuccess();
}

final class LoginErorr extends LoginState {
  const LoginErorr(this.message);
  final String message;
}
