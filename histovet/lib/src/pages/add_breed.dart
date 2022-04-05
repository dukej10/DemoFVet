import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';

import '../models/breed_model.dart';

class AddBreed extends StatefulWidget {
  static String id = "addbreed_page";
  final Function(Breed) insertBreed;
  final Breed? breed;

  AddBreed(this.insertBreed, this.breed);

  @override
  State<AddBreed> createState() => _AddBreedState();
}

class _AddBreedState extends State<AddBreed> {
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

  void addBreed() {
    final Breed breed;
    breed = Breed("", codeController.text, nameController.text);
    widget.insertBreed(breed);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Agregar Raza", style: txtStyle),
              buildTextFormField(
                  "Code", Icons.code, codeController, TextInputType.text),
              buildTextFormField("Name", Icons.text_fields, nameController,
                  TextInputType.text),
              Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    "Agregar Raza",
                    style: txtStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    addBreed();
                  },
                ),
              )
            ],
          ),
        ));
  }
}
