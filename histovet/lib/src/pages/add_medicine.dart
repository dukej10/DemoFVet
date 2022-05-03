import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/pages/pets_page.dart';
import 'package:histovet/src/pages/widgets/age.dart';
import 'package:histovet/src/pages/widgets/breed.dart';
import 'package:histovet/src/pages/widgets/codeMedicine.dart';
import 'package:histovet/src/pages/widgets/contact_owner.dart';
import 'package:histovet/src/pages/widgets/descriptionMedicine.dart';
import 'package:histovet/src/pages/widgets/document_owner.dart';
import 'package:histovet/src/pages/widgets/groupMedicine.dart';
import 'package:histovet/src/pages/widgets/name.dart';
import 'package:histovet/src/pages/widgets/nameMedicine.dart';
import 'package:histovet/src/pages/widgets/name_owner.dart';
import 'package:histovet/src/pages/widgets/sex.dart';
import 'package:histovet/src/pages/widgets/specie.dart';

import 'package:histovet/src/pages/widgets/color.dart';
import 'package:histovet/src/services/pet_service.dart';
import 'package:provider/provider.dart';

import '../models/medicine_model.dart';
import '../models/pet_model.dart';
import '../services/medicine_service.dart';
import 'widgets/code.dart';

class addMedicine extends StatefulWidget {
  static String id = "form_medicine";
  addMedicine({Key? key}) : super(key: key);

  @override
  State<addMedicine> createState() => _addMedicine();
}

class _addMedicine extends State<addMedicine> {
  final MedicineService _service = MedicineService();
  final _formState = GlobalKey<FormBuilderState>();
  bool respuesta = false;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Registrar medicamento"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          getInfoMedicine();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: ListView(
            children: [CodeMedicine(),NameMedicine(), DescriptionMedicine(), GroupMedicine()],
          )),
    );
  }

  getInfoMedicine() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      final code = values['code'];
      final name = values['name'];
      final description = values['description'];
      final group = values['group'];
      late Medicine medicine = new Medicine("",code, name, description,group);
      addMedicine(medicine);
    }
  }
  void addMedicine(Medicine medicine) async{
    respuesta = await _service.storeMedicineToFirebase(medicine);
    if (respuesta) {
            Navigator.pushNamed(context, '/medicine').then((_) => setState(() {}));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Se guardó la información"),
            backgroundColor: Colors.green,));
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No se guardó la información"),
            backgroundColor: Colors.green,));
          }
  }

  
}
