import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class GroupMedicine extends StatelessWidget {
  const GroupMedicine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
        name: "group",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: "Grupo",
            hintText: "Ingrese el grupo del medicamento",
            prefixIcon: Icon(Icons.medication),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.teal))),
        keyboardType: TextInputType.text,
                      maxLength: 10,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ])
      ),
    );
  }
}
