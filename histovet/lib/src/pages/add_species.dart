import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/models/specie_model.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';

import '../models/breed_model.dart';

class AddSpecie extends StatefulWidget {
  static String id = "AddSpecie_page";
  final Function(Specie) insertSpecie;

  AddSpecie(this.insertSpecie);

  @override
  State<AddSpecie> createState() => _AddSpecieState();
}

class _AddSpecieState extends State<AddSpecie> {
  TextStyle txtStyle = TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  buildTextFormField(hint, iconData, textController, inputType) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: TextFormField(
          keyboardType: inputType,
          controller: textController,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: hint,
              prefixIcon: Icon(iconData)),
        ));
  }

  void AddSpecie() {
    final Specie breed;
    breed = Specie("", codeController.text, nameController.text);
    widget.insertSpecie(breed);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Agregar Especie", style: txtStyle),
              buildTextFormField(
                  "Code", Icons.code, codeController, TextInputType.text),
              buildTextFormField("Name", Icons.text_fields, nameController,
                  TextInputType.text),
              Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    "Agregar Especie",
                    style: txtStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    AddSpecie();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
