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
      child: FormBuilderDropdown(
            name: "subespecie",
            decoration: InputDecoration(
                labelText: "Subespecie",
                prefixIcon: Icon(Icons.article_outlined),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal))),
            hint: Text("Seleccionar subespecie"),
            validator: FormBuilderValidators.required(context,
                errorText: "Valor requerido"),
            items: [
              {'value': 'Perro', 'key': 'Perro'},
              {'value': 'Gato', 'key': 'Gato'}
            ].map((subespecie) => DropdownMenuItem(
                value: subespecie["value"], child: Text("${subespecie["value"]}"))).toList()),
    );
  }
}
