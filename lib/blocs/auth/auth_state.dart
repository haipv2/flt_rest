import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';
import 'package:flutter/widgets.dart';

class AuthState extends BlocState {
  final bool isAuthed;
  final bool isAuthing;
  final bool hasFailed;
  final bool isAnonymous;
  String name;
  String id;
  String role;

  AuthState(
      {@required this.isAuthed,
      this.isAuthing: false,
      this.hasFailed: false,
      this.isAnonymous: true,
      this.name: '',
      this.id: '',
      this.role: ''});

  factory AuthState.notAuth() {
    return AuthState(
      isAuthed: false,
      isAnonymous: true,
    );
  }

  factory AuthState.authed(String name, String id, String role) {
    return AuthState(
      isAuthed: true,
      name: name,
      id: id,
      role: role,
    );
  }

  factory AuthState.authing() {
    return AuthState(
      isAuthed: false,
      hasFailed: true,
    );
  }

  factory AuthState.failure() {
    return AuthState(
      isAuthed: false,
      hasFailed: true,
      isAnonymous: true,
    );
  }
}
