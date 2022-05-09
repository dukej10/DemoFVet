import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FechaMedicine extends StatelessWidget {
  const FechaMedicine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
        name: "fechaVen",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: "Fecha vencimiento",
            hintText: "Ingrese la fecha de vencimiento",
            prefixIcon: Icon(Icons.medication),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
        maxLength: 20,
        validator: FormBuilderValidators.required(context,
            errorText: "Valor requerido"),
      ),
    );
  }
}
