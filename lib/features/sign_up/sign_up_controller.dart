import 'package:finance/features/sign_up/sign_up_state.dart';
import 'package:finance/services/auth_service.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;
  SignUpController(this._service);

  SignUpState _state = SignUpStateInitial();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    const secureStorage = SecureStorage();
    _changeState(SignUpStateLoading());
    try {
      final user = await _service.signUp(
        name: name,
        email: email,
        password: password,
      );

      if (user.id != null) {
        await secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );

        _changeState(
          SignUpStateSuccess(),
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(
        SignUpStateError(
          e.toString(),
        ),
      );
    }
  }
}
