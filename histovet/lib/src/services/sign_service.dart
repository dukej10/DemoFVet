import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:histovet/src/pages/Login/reset_password.dart';

class SignService {
  final FirebaseAuth _firestore = FirebaseAuth.instance;

  Future<bool> signIn(String correo, String password) async {
    try {
      await _firestore.signInWithEmailAndPassword(
          email: correo, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> crearCuenta(String correo, String password) async {
    try {
      await _firestore.createUserWithEmailAndPassword(
          email: correo, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _firestore.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await _firestore.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> username() async {
    try {
      final User? user = await _firestore.currentUser;
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
      final User? user = await _firestore.currentUser;
      final uid = user?.uid;
      bool admin = false;

      administradores.forEach((element) {
        if (uid == element) {
          admin = true;
        }
      });

      // if (uid == '5Q5W4CWh9KUSz0J6uSuCxuhxZAm2') {
      //   //uid admin

      //   return true;
      // } else {
      //   return false;
      // }
      return admin;
    } catch (e) {
      return false;
    }
  }
}
