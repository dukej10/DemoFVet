import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
