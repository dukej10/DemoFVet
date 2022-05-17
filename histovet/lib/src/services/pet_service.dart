import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pet_model.dart';

import 'package:firebase_database/firebase_database.dart';

class PetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Pet> getPetBD(String id) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('pet').doc(id).get();
    Pet pet = new Pet(
        snapshot["id"],
        snapshot["code"],
        snapshot["name"],
        snapshot["nameOwner"],
        snapshot["contactOwner"],
        snapshot["documentOwner"],
        snapshot["age"],
        snapshot["breed"],
        snapshot["specie"],
        snapshot["color"],
        snapshot["sex"]);
    return pet;
  }

  Future<bool> addPetBD(Pet pet) async {
    final DocumentReference petDoc = _firestore.collection("pet").doc();

    try {
      await petDoc.set({
        "id": petDoc.id,
        "code": pet.code,
        "name": pet.name,
        "nameOwner": pet.nameOwner,
        "contactOwner": pet.contactOwner,
        "documentOwner": pet.documentOwner,
        "age": pet.age,
        "breed": pet.breed,
        "specie": pet.specie,
        "color": pet.color,
        "sex": pet.sex
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updatePetBD(Pet pet) async {
    try {
      final DocumentReference petDoc = _firestore.collection("pet").doc();
      await FirebaseFirestore.instance.collection("pet").doc(pet.id).set({
        "id": pet.id,
        "code": pet.code,
        "name": pet.name,
        "nameOwner": pet.nameOwner,
        "contactOwner": pet.contactOwner,
        "documentOwner": pet.documentOwner,
        "age": pet.age,
        "breed": pet.breed,
        "specie": pet.specie,
        "color": pet.color,
        "sex": pet.sex
      }, SetOptions(merge: true));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deletePetBD(String id) async {
    try {
      await _firestore.collection("pet").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Pet>> getPetsBD() async {
    List<Pet> mascotas = [];
    try {
      final collection = FirebaseFirestore.instance.collection('pet');
      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          //print(doc.data());
          Pet newPet = Pet(
              data["id"],
              data["code"],
              data["name"],
              data["nameOwner"],
              data["contactOwner"],
              data["documentOwner"],
              data["age"],
              data["breed"],
              data["specie"],
              data["color"],
              data["sex"]);
          mascotas.add(newPet);
        }
      });
      return mascotas;
    } catch (e) {
      return mascotas;
    }
  }
}
