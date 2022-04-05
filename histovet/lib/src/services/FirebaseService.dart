import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/breed_model.dart';
import '../models/specie_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeBreedToFirebase(Breed breed) async {
    final DocumentReference breedDoc = _firestore.collection("breed").doc();

    await breedDoc
        .set({"id": breedDoc.id, "code": breed.code, "name": breed.name});
  }

  Future<void> deleteBreedFromFirebase(id) async {
    await _firestore.collection("breed").doc(id).delete();
  }

  Future<void> storeSpecieToFirebase(Specie specie) async {
    final DocumentReference specieDoc = _firestore.collection("specie").doc();

    await specieDoc
        .set({"id": specieDoc.id, "code": specie.code, "name": specie.name});
  }

  Future<void> deleteSpecieFromFirebase(id) async {
    await _firestore.collection("specie").doc(id).delete();
  }
}
