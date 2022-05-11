import 'package:histovet/src/models/medicine_model.dart';

import '../services/medicine_service.dart';

class MedicineController {
  final MedicineService _service = MedicineService();
  void deletePet(medicineId) {
    _service.deleteMedicineFromFirebase(medicineId);
  }

  Future<Medicine> getMedicine(String name) async {
    Medicine _medicine = await _service.getMedicine(name);
    return _medicine;
  }

  Future<Medicine> searchMedicine(String name) async {
    Medicine _medicine = await _service.searchMedicineBD(name);
    return _medicine;
  }
}
