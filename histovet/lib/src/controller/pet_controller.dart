import '../services/pet_service.dart';

class PetController{
  final PetService _service = PetService();
   void deletePet(petId) {
    _service.deletePetFromFirebase(petId);
  }
}