import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:histovet/src/pages/medicine/add_medicine.dart';

import '../models/medicine_model.dart';
import '../services/medicine_service.dart';

class MedicineController{
  final MedicineService _service = MedicineService();
  List<Medicine> medicines = [];

  Future<bool> addMedicine(Medicine medicine) async {
    bool respuesta;
    respuesta = await _service.addMedicine(medicine);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Medicine>> searchMedicine(String name) async {
    List<Medicine> medicines = [];
    print("Llegó nombre " + name);
    try {
    final collection = FirebaseFirestore.instance.collection('medicine').where("name", isEqualTo: name);
    collection.snapshots().listen((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();
        print("encontró");
        print(doc.data());
        Medicine newMedicine = Medicine(data["id"], data["code"], data["name"], data["description"], data["group"],data["precio"],data["fechaVen"]);
        medicines.add(newMedicine);
      }
    });
    return medicines;
    } catch (e) {
      return medicines;
    }
  }

  Future<bool> updateMedicine(Medicine medicine) async {
    bool respuesta;
    respuesta = await _service.updateMedicine(medicine);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteMedicine(String idMedicine) async {
    bool respuesta;
    respuesta = await _service.deleteMedicineFromFirebase(idMedicine);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Medicine>> allMedicines() async{
    medicines = await _service.getMedicines();
    return medicines;
  }

  Future<Medicine> getMedicine(String id) async {
     Medicine medicine = await _service.getMedicine(id);
     return medicine;
  }

}