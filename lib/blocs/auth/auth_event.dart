import 'package:flt_rest/blocs/bloc_helper/bloc_event_state.dart';
import 'package:flutter/material.dart';

abstract class AuthEvent extends BlocEvent {
  final String name, id, role;

  AuthEvent({
    this.name: '',
    this.id: '',
    this.role: '',
  });
}

class AuthEventLogin extends AuthEvent {
  AuthEventLogin({String name, String id, String role})
      : super(
          name: name,
          id: id,
          role: role,
        );
}

class AuthEventLogout extends AuthEvent {}
