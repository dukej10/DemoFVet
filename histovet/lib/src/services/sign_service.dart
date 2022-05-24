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
}
