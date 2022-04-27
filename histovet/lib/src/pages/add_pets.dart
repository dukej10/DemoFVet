import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/pages/widgets/age.dart';
import 'package:histovet/src/pages/widgets/breed.dart';
import 'package:histovet/src/pages/widgets/contact_owner.dart';
import 'package:histovet/src/pages/widgets/document_owner.dart';
import 'package:histovet/src/pages/widgets/name.dart';
import 'package:histovet/src/pages/widgets/name_owner.dart';
import 'package:histovet/src/pages/widgets/sex.dart';
import 'package:histovet/src/pages/widgets/specie.dart';

import 'package:histovet/src/pages/widgets/color.dart';

import 'widgets/code.dart';

class addPet extends StatefulWidget {
  static String id = "form_pet";
  addPet({Key? key}) : super(key: key);

  @override
  State<addPet> createState() => _addPetState();
}

class _addPetState extends State<addPet> {
  final _formState = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Editar Mascota"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          getInfoPet();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: ListView(
            children: [Code(),Name(), nameOwner(), contactOwner(), docOwner(),Age(), Breed(),Specie(), Color(), Sex()],
          )),
    );
  }

  getInfoPet() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      final code = values['code'];
      final name = values['name'];
      final docOwner = values['docOwner'];
      final nameOwner = values['nameOwner'];
      final contactOwner = values['contactOwner'];
      final age = values['age'];
      final breed = values['breed'];
      final specie = values['specie'];
      final color = values['color'];
      final sex = values['sex'];
    }
  }
}
