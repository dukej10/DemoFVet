import 'package:histovet/src/services/auth_service.dart';

class AuthController {
  final AuthService _auth = AuthService();

  Future<bool> signIn(String email, String password) async {
    bool answer = await _auth.signIn(email, password);
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp(String email, String password) async {
    bool answer = await _auth.createAccount(email, password);
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    bool answer = await _auth.resetPassword(email);
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signOut() async {
    bool answer = await _auth.signOut();
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> username() async {
    String username = await _auth.username();
    if (username != "") {
      return username;
    } else {
      return "";
    }
  }

  Future<bool> estado() async {
    bool estado = await _auth.estado();
    if (estado) {
      return true;
    } else {
      return false;
    }
  }
}
