import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> createAccount(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> username() async {
    try {
      final User? user = _auth.currentUser;
      final name = user?.email;
      return name.toString();
    } catch (e) {
      return "";
    }
  }

  Future<bool> estado() async {
    try {
      final administradores = [
        "5Q5W4CWh9KUSz0J6uSuCxuhxZAm2",
        "Kwiz2KFQYdTwDm1skFgxeBaF1LV2",
        "iPDk5F0wvYeYferaZoPcLaa6MwL2"
      ];
      final User? user = _auth.currentUser;
      final uid = user?.uid;
      bool admin = false;

      for (var element in administradores) {
        if (uid == element) {
          admin = true;
        }
      }

      return admin;
    } catch (e) {
      return false;
    }
  }
}
