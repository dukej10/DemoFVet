import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class docOwner extends StatelessWidget {
  const docOwner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
        name: "docOwner",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: "Documento Dueño",
            hintText: "Ingrese el documento del dueño",
            prefixIcon: Icon(Icons.pets),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),  
                keyboardType: TextInputType.number,
        maxLength: 10,
        validator: FormBuilderValidators.required(context,
            errorText: "Valor requerido"),
      ),
    );
  }
}
