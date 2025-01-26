
import 'package:bouek/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUsecase}) : super(const LoginInitial());
  final LoginUsecase loginUsecase;

  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      emit(const Logining());
      await loginUsecase.call(email: email, password: password);
      emit(const LoginSuccess());
    } catch (e) {
      emit(LoginErorr(e.toString()));
    }
  }
}
