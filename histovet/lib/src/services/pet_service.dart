import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pet_model.dart';

import 'package:firebase_database/firebase_database.dart';
class PetService {
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance.ref();

  CollectionReference petAll =
      FirebaseFirestore.instance.collection("pet");

  Future<bool> storePetToFirebase(Pet specie) async {
    try {
      final DocumentReference specieDoc = _firestore.collection("pet").doc();

    if (specie.id!.isNotEmpty) {
      await FirebaseFirestore.instance.collection("pet").doc(specie.id).set(
          {"id": specie.id, "code": specie.code, "name": specie.name, "nameOwner": specie.nameOwner, "contactOwner": specie.contactOwner, "documentOwner": specie.documentOwner,"age": specie.age, "breed": specie.breed, "specie": specie.specie, "color":specie.color, "sex": specie.sex},
          SetOptions(merge: true));
       return true;
    } else {
      await specieDoc
          .set({"id": specieDoc.id, "code": specie.code, "name": specie.name, "nameOwner": specie.nameOwner, "contactOwner": specie.contactOwner, "documentOwner": specie.documentOwner, "age": specie.age, "breed": specie.breed, "specie": specie.specie, "color":specie.color, "sex": specie.sex});
          return true;
    }
    } catch (e) {
      return false;
    }
  }

  Future<void> deletePetFromFirebase(id) async {
    await _firestore.collection("pet").doc(id).delete();
  }

  Future<List<Pet>> getPets() async {
    List<Pet> mascotas = [];
    try {
    final collection = FirebaseFirestore.instance.collection('pet');
    collection.snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        print(doc.data());
        Pet newPet = Pet(data["id"], data["code"], data["name"], data["nameOwner"], data["contactOwner"],data["documentOwner"],data["age"], data["breed"], data["specie"], data["color"], data["sex"] );
        mascotas.add(newPet);
      }
    });
    return mascotas;
    } catch (e) {
      return mascotas;
    }
    
  }

}
