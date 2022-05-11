import '../models/pet_model.dart';
import '../services/pet_service.dart';

class PetController {
  final PetService _service = PetService();
  List<Pet> mascotas = [];

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

  Future<bool> deletePet(String idPet) async {
    bool respuesta;
    respuesta = await _service.deletePetFromFirebase(idPet);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Pet>> allPets() async {
    mascotas = await _service.getPets();
    return mascotas;
  }

  Future<Pet> getPet(String id) async {
    Pet pet = await _service.getPet(id);
    return pet;
  }
}
