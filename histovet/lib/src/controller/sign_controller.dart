import 'package:histovet/src/services/sign_service.dart';

class SignController {
  SignService sign = SignService();

  Future<bool> signIn(String correo, String password) async {
    bool answer = await sign.signIn(correo, password);
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signUp(String correo, String password) async {
    bool answer = await sign.crearCuenta(correo, password);
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> reset(String email) async {
    bool answer = await sign.resetPassword(email);
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signOut() async {
    bool answer = await sign.signOut();
    if (answer) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> username() async {
    String username = await sign.username();
    if (username != "") {
      return username;
    } else {
      return "";
    }
  }

  Future<bool> estado() async {
    bool estado = await sign.estado();
    if (estado) {
      return true;
    } else {
      return false;
    }
  }
}
