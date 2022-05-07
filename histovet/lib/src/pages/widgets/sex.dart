import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Sex extends StatelessWidget {
  const Sex({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: FormBuilderDropdown(
            name: "sex",
            decoration: InputDecoration(
                labelText: "Sexo",
                prefixIcon: Icon(Icons.article_outlined),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal))),
            hint: Text("Seleccionar sexo"),
            validator: FormBuilderValidators.required(context,
                errorText: "Valor requerido"),
            items: [
              {'value': 'Macho', 'key': 'Macho'},
              {'value': 'Hembra', 'key': 'Hembra'}
            ].map((sex) => DropdownMenuItem(
                value: sex["value"], child: Text("${sex["value"]}"))).toList()));
  }
}
