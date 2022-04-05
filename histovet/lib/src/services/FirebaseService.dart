import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/breed_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeBreedToFirebase(Breed breed) async {
    final DocumentReference breedDoc = _firestore.collection("breed").doc();

    await breedDoc
        .set({"id": breedDoc.id, "code": breed.code, "name": breed.name});
  }
}
