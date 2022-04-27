import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Specie extends StatelessWidget {
  const Specie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
        name: "specie",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: "Especie",
            hintText: "Ingrese la especie de la mascota",
            prefixIcon: Icon(Icons.pets),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
        maxLength: 10,
        validator: FormBuilderValidators.required(context,
            errorText: "Valor requerido"),
      ),
    );
  }
}
