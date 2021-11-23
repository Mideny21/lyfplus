import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lyfplus_mobile/repositories/models/auth.dart';
import 'package:lyfplus_mobile/repositories/user_repository.dart';

part 'login_event.dart';  
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        super(LoginState.empty());

  // @override
  // Stream<Transition<LoginEvent, LoginState>> transformEvents(
  //   Stream<LoginEvent> events,
  //   TransitionFunction<LoginEvent, LoginState> transitionFn,
  // ) {
  //   final nonDebounceStream = events.where((event) {
  //     return (event is! EmailChanged && event is! PasswordChanged);
  //   });
  //   final debounceStream = events.where((event) {
  //     return (event is EmailChanged || event is PasswordChanged);
  //   }).debounceTime(Duration(milliseconds: 300));
  //   return super.transformEvents(
  //     nonDebounceStream.mergeWith([debounceStream]),
  //     transitionFn,
  //   );
  // }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      final Auth auth =
          await _userRepository.loginWithCredentials(email, password);
      storeUserData(auth.token, auth.userID, auth.username);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  void storeUserData(String token, int userID, String userName) async {}
}
