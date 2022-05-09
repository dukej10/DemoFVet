import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:histovet/src/models/medicine_model.dart';

import '../models/pet_model.dart';

import 'package:firebase_database/firebase_database.dart';


class MedicineService {
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance.ref();
  Medicine medicine = new Medicine("", "", "","","",0.0, "");

  Future<Medicine> getMedicine(String id) async {
     final snapshot= await FirebaseFirestore.instance.collection('medicine').doc(id).get();
     Medicine medicine = new Medicine(snapshot["id"], snapshot["code"], snapshot["name"], snapshot["description"], snapshot["group"],snapshot["precio"],snapshot["fechaVen"]);
     print(medicine.toString());
     return medicine;
  }
  CollectionReference medicineAll =
      FirebaseFirestore.instance.collection("medicine");


 Future<bool> storeMedicineToFirebase(Medicine medicine) async {
    try {
      final DocumentReference medicineDoc = _firestore.collection("medicine").doc();

    if (medicine.id!.isNotEmpty) {
      await FirebaseFirestore.instance.collection("medicine").doc(medicine.id).set(
          {"id": medicine.id, "code": medicine.code, "name": medicine.name, "description": medicine.descripcion, "group":medicine.grupo, "precio":medicine.precio,"fechaVen":medicine.fechaVen},
          SetOptions(merge: true));
       return true;
    } else {
      await medicineDoc
          .set({"id": medicineDoc.id, "code": medicine.code, "name": medicine.name, "description": medicine.descripcion, "group":medicine.grupo, "precio":medicine.precio, "fechaVen":medicine.fechaVen});
          return true;
    }
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteMedicineFromFirebase(id) async {
    await _firestore.collection("medicine").doc(id).delete();
  }

  Future<List<Medicine>> getMedicines() async {
    List<Medicine> medicinas = [];
    try {
    final collection = FirebaseFirestore.instance.collection('medicine');
    collection.snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        print(doc.data());
        Medicine newMedicine = Medicine(data["id"], data["code"], data["name"], data["description"], data["group"], data["precio"], data["fechaVen"]);
        medicinas.add(newMedicine);
      }
    });
    return medicinas;
    } catch (e) {
      return medicinas;
    }
    
  }

}
