import '../models/pet_model.dart';
import '../services/pet_service.dart';

class PetController {
  final PetService _service = PetService();
  List<Pet> _pets = [];
  

  Future<bool> addPet(Pet pet) async {
    bool respuesta;
    respuesta = await _service.addPetBD(pet);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatePet(Pet pet) async {
    bool respuesta;
    respuesta = await _service.updatePetBD(pet);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deletePet(String idPet) async {
    bool respuesta;
    respuesta = await _service.deletePetBD(idPet);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Pet>> allPets() async {
    _pets = await _service.getPetsBD();
    return _pets;
  }

  Future<Pet> getPet(String id) async {
    Pet pet = await _service.getPetBD(id);
    return pet;
  }
}
