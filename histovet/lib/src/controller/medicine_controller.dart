import '../services/medicine_service.dart';

class MedicineController{
  final MedicineService _service = MedicineService();
   void deletePet(medicineId) {
    _service.deleteMedicineFromFirebase(medicineId);
  }
}