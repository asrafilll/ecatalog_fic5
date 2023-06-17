import 'package:fic5_ecatalog_asrafilll/features/authentication/data/datasources/auth_data_sources.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/login_request_model.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/login_response_model.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/register_request_model.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/register_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthDataSource dataSource;

  AuthenticationBloc(this.dataSource) : super(AuthenticationInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await dataSource.register(event.data);
      result.fold(
        (error) => emit(RegisterFailed(errorMessage: error)),
        (success) => emit(RegisterSuccess(data: success)),
      );
    });

    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await dataSource.login(event.data);
      result.fold(
        (error) => emit(LoginFailed(errorMessage: error)),
        (success) => emit(LoginSuccess(data: success)),
      );
    });
  }
}
