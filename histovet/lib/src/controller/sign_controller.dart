import 'package:histovet/src/services/sign_service.dart';

class SignController {
  SignService sign = SignService();

  Future<bool> signIn(String correo, String password) async {
    bool paso = await sign.signIn(correo, password);
    if (paso) {
      return true;
    } else {
      return false;
    }
  }
}
