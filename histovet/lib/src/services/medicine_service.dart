import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/medicine_model.dart';

import 'package:firebase_database/firebase_database.dart';
class MedicineService {
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance.ref();

  Medicine medicine = Medicine("", "", "","","",0.0, "");

  Future<Medicine> getMedicine(String id) async {
     final snapshot= await FirebaseFirestore.instance.collection('medicine').doc(id).get();
     Medicine medicine = Medicine(snapshot["id"], snapshot["code"], snapshot["name"], snapshot["description"], snapshot["group"],snapshot["precio"],snapshot["fechaVen"]);
     //print(medicine.toString());
     return medicine;
  }


  Future<List<Medicine>> searchMedicine(String name) async {
    List<Medicine> medicines = [];
    //print("Llegó nombre " + name);
    try {
    final collection = FirebaseFirestore.instance.collection('medicine').where("name", isEqualTo: name);
    collection.snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        // print("encontró");
        // print(doc.data());
        Medicine newMedicine = Medicine(data["id"], data["code"], data["name"], data["description"], data["group"],data["precio"],data["fechaVen"]);
        medicines.add(newMedicine);
      }
    });
    return medicines;
    } catch (e) {
      return medicines;
    }
    
  }



  CollectionReference medicineAll =
      FirebaseFirestore.instance.collection("medicine");



  Future<bool> addMedicine(Medicine medicine) async {
     final DocumentReference medicineDoc = _firestore.collection("medicine").doc();
      
    try {
      await medicineDoc
          .set({"id": medicineDoc.id, "code": medicine.code, "name": medicine.name, "description": medicine.descripcion, "group": medicine.grupo, 
          "precio": medicine.precio, "fechaVen": medicine.fechaVen});
          return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateMedicine(Medicine medicine) async {
    try {
      //final DocumentReference medicineDoc = _firestore.collection("medicine").doc();
      await FirebaseFirestore.instance.collection("medicine").doc(medicine.id).set(
          {"id": medicine.id, "code": medicine.code, "name": medicine.name, "description": medicine.descripcion, "group": medicine.grupo, 
          "precio": medicine.precio, "fechaVen": medicine.fechaVen},
          SetOptions(merge: true));
       return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteMedicineFromFirebase(id) async {
    try {
      await _firestore.collection("medicine").doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Medicine>> getMedicines() async {
    List<Medicine> medicines = [];
    try {
    final collection = FirebaseFirestore.instance.collection('medicine');
    collection.snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        //print(doc.data());
        Medicine newMedicine = Medicine(data["id"], data["code"], data["name"], data["description"], data["group"],data["precio"],data["fechaVen"]);
        medicines.add(newMedicine);
      }
    });
    return medicines;
    } catch (e) {
      return medicines;
    }
    
  }

}
