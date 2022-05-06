import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class contactOwner extends StatelessWidget {
  const contactOwner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
        name: "contactOwner",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: "contacto Dueño",
            hintText: "Ingrese el contacto del dueño",
            prefixIcon: Icon(Icons.pets),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),  
                keyboardType: TextInputType.number,
        maxLength: 10,
        validator: FormBuilderValidators.compose([ FormBuilderValidators.required(context,
            errorText: "Valor requerido"),
            FormBuilderValidators.integer(context, errorText: "No puede tener decimales"),
            FormBuilderValidators.min(context, 1, errorText: "Debe ser un número mayor que 0"),
            FormBuilderValidators.minLength(context, 10,
                errorText: "La longitud del número es de 10")
            ]),
      ),
    );
  }
}
