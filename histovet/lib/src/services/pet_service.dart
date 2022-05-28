import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/pet_model.dart';

class PetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Pet> getPetBD(String id) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('pet').doc(id).get();
    Pet pet = Pet(
        snapshot["id"],
        snapshot["user_id"],
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

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    try {
      await petDoc.set({
        "id": petDoc.id,
        "user_id": user?.uid,
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

  Future<List<Pet>> searchPet(String code) async {
    List<Pet> mascotas = [];
    print("Llegó code " + code);
    try {
      final collection = FirebaseFirestore.instance
          .collection('pet')
          .where("code", isEqualTo: code);
      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          print("encontró");
          print(doc.data());
          Pet newMedicine = Pet(
              data["id"],
              data["user_id"],
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
          mascotas.add(newMedicine);
        }
      });
      return mascotas;
    } catch (e) {
      return mascotas;
    }
  }

  Future<bool> updatePetBD(Pet pet) async {
    try {
      await FirebaseFirestore.instance.collection("pet").doc(pet.id).set({
        "id": pet.id,
        "user_id": pet.user_id,
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;

    List<Pet> mascotas = [];

    print(uid);

    try {
      var collection;

      if (uid == '5Q5W4CWh9KUSz0J6uSuCxuhxZAm2') {
        //uid admin
        collection = FirebaseFirestore.instance.collection('pet');
   
      } else {
        collection = FirebaseFirestore.instance
            .collection('pet')
            .where('user_id', isEqualTo: uid);
      }

      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          //print(doc.data());
          Pet newPet = Pet(
              data["id"],
              data["user_id"],
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
