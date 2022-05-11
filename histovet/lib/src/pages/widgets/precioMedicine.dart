import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PrecioMedicine extends StatelessWidget {
  const PrecioMedicine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
        name: "precio",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: "Precio",
            hintText: "Ingrese el precio del medicamento",
            prefixIcon: Icon(Icons.medication),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
        maxLength: 10,
        keyboardType: TextInputType.number,
        validator: FormBuilderValidators.required(context,
            errorText: "Valor requerido"),
      ),
    );
  }
}
