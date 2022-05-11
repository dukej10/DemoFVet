import '../models/clinicalHistory_model.dart';
import '../services/clinicalHistory_Service.dart';

class ClinicalHistoryController {
  final ClinicalHistoryService _service = ClinicalHistoryService();
  List<ClinicalHistory> clinicalHistories = [];

  Future<bool> addClinicalHistory(ClinicalHistory clinicalHistory) async {
    bool respuesta;
    respuesta = await _service.addClinicalHistory(clinicalHistory);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateClinicalHistory(ClinicalHistory clinicalHistory) async {
    bool respuesta;
    respuesta = await _service.updateClinicalHistory(clinicalHistory);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteHistory(String idHistory) async {
    bool respuesta;
    respuesta = await _service.deleteHistoryBD(idHistory);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<ClinicalHistory>> allClinicalHistories() async {
    clinicalHistories = await _service.getClinicalHistories();
    return clinicalHistories;
  }

  Future<ClinicalHistory> getClinicalHistory(String id) async {
    ClinicalHistory clinicalHistory = await _service.getClinicalHistory(id);
    return clinicalHistory;
  }
}
