import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../controller/clinicalHistory_controller.dart';
import '../../models/clinicalHistory_model.dart';

class updateHistory extends StatefulWidget {
  static String id = "edit_history";
  final String idHistory;
  updateHistory(this.idHistory,{Key? key}) : super(key: key);

  @override
  State<updateHistory> createState() => _updateHistoryState();
}

class _updateHistoryState extends State<updateHistory> {
  final _formState = GlobalKey<FormBuilderState>();
  ClinicalHistoryController histCont = new ClinicalHistoryController();
  bool respuesta = false;

  // Text Editing Controller


  @override
  Widget build(BuildContext context) {
    return Container(); // Esto se modifica
  }
}