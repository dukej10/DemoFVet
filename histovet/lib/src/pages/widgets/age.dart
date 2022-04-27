import 'packAge:flutter/material.dart';
import 'packAge:flutter_form_builder/flutter_form_builder.dart';
import 'packAge:form_builder_validators/form_builder_validators.dart';

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
        name: "age",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: "Edad",
            hintText: "Ingresa la edad de la mascotas",
            prefixIcon: Icon(Icons.pets),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
                keyboardType: TextInputType.number,
        maxLength: 2,
        validator: FormBuilderValidators.required(context,
            errorText: "Valor requerido"),
      ),
    );
  }
}
