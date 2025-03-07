import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _email = "";
  String _password = "";
  bool _isPasswordVisible = false;
  String? _emailError;
  String? _passwordError;

  String get email => _email;
  String get password => _password;
  bool get isPasswordVisible => _isPasswordVisible;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;

  void setEmail(String value) {
    _email = value;
    _emailError = _validateEmail(value);
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _passwordError = _validatePassword(value);
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) return "Email cannot be empty";
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
      return "Invalid email address";
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return "Password cannot be empty";
    if (password.length < 6) return "Password must be at least 6 characters";
    return null;
  }

  bool validateForm() {
    _emailError = _validateEmail(_email);
    _passwordError = _validatePassword(_password);
    notifyListeners();
    return _emailError == null && _passwordError == null;
  }
}
