import '../models/pet_model.dart';
import '../services/pet_service.dart';

class PetController{
  final PetService _service = PetService();
   void deletePet(petId) {
    _service.deletePetFromFirebase(petId);
  }

  Future<bool> addPet(Pet pet) async {
    bool respuesta;
    respuesta = await _service.addPet(pet);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatePet(Pet pet) async {
    bool respuesta;
    respuesta = await _service.updatePet(pet);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }


}