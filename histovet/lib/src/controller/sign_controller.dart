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
}
