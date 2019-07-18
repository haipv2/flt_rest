import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends BlocEventStateBase<AuthEvent, AuthState> {
  AuthBloc() : super(initState: AuthState.notAuth());

  @override
  Stream<AuthState> eventhandler(
      AuthEvent event, AuthState currentState) async* {
    if (event is AuthEventLogin) {
      // processing authentication
      yield AuthState.authing();

      //get use info
      await Future.delayed(const Duration(seconds: 2));

      // successfully login
      if (event.name == "failure") {
        yield AuthState.failure();
      } else {
        yield AuthState.authed(event.name, event.id, event.role);
      }
    }
    if (event is AuthEventLogout) {
      yield AuthState.notAuth();
    }
  }
}
