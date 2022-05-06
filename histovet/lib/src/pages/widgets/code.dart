import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Code extends StatelessWidget {
  const Code({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
        name: "code",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: "Código",
            hintText: "Ingrese el código de la mascotas",
            prefixIcon: Icon(Icons.pets),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
               keyboardType: TextInputType.number,
        maxLength: 4,
        validator: FormBuilderValidators.compose([ FormBuilderValidators.required(context,
            errorText: "Valor requerido"),
            FormBuilderValidators.integer(context, errorText: "No puede tener decimales"),
            FormBuilderValidators.min(context, 1, errorText: "Debe ser un número mayor que 0"), 
            FormBuilderValidators.minLength(context, 4,
                errorText: "La longitud del documento es de 4")]),
      ),
    );
  }
}
