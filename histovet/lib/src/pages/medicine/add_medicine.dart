import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/controller/medicine_controller.dart';
import 'package:histovet/src/pages/pet/pets_page.dart';

import '../../models/medicine_model.dart';
import '../../services/medicine_service.dart';
import 'package:intl/intl.dart';

class addMedicine extends StatefulWidget {
  static String id = "form_medicine";
  addMedicine({Key? key}) : super(key: key);

  @override
  State<addMedicine> createState() => _addMedicine();
}

class _addMedicine extends State<addMedicine> {
  final MedicineService _service = MedicineService();
  final _formState = GlobalKey<FormBuilderState>();
  bool respuesta = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Registrar medicamento"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          getInfoMedicine();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  name: "code",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Código",
                      hintText: "Ingrese el código del medicamento",
                      prefixIcon: Icon(Icons.code),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                    FormBuilderValidators.integer(context,
                        errorText: "No puede tener decimales"),
                    FormBuilderValidators.min(context, 1,
                        errorText: "Debe ser un número mayor que 0"),
                    FormBuilderValidators.minLength(context, 4,
                        errorText: "La longitud del documento es de 4")
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    name: "name",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Nombre",
                        hintText: "Ingrese el nombre del medicamento",
                        prefixIcon: Icon(Icons.people),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.text,
                    maxLength: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    name: "description",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Descripción",
                        hintText: "Ingrese la descripción del medicamento",
                        prefixIcon: Icon(Icons.description),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.text,
                    maxLength: 30,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    name: "group",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Grupo",
                        hintText: "Ingrese el grupo del medicamento",
                        prefixIcon: Icon(Icons.group),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.text,
                    maxLength: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  name: "precio",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Precio",
                      hintText: "Ingrese el precio del medicamento",
                      prefixIcon: Icon(Icons.price_change),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                    FormBuilderValidators.numeric(context,
                        errorText: "Debe ser un numero"),
                    FormBuilderValidators.min(context, 1,
                        errorText: "Debe ser un número mayor que 0"),
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),

                
                child: FormBuilderTextField(
                  name: "fechaVen",

                  

                  //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requiremen

                      setState(() {
                        Text(formattedDate); //set output date to TextField value.
                      });
                    }
                    
                  },

          
                ),
              )
            ],
          )),
    );
  }

  getInfoMedicine() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      final code = values['code'];
      final name = values['name'];
      final description = values['description'];
      final group = values['group'];
      final precio = double.parse(values['precio']);
      final fechaVen = values['fechaVen'];
      late Medicine medicine =
          new Medicine("", code, name, description, group, precio, fechaVen);
      addMedicine(medicine);
    }
  }

  void addMedicine(Medicine medicine) async {
    respuesta = await _service.addMedicine(medicine);
    if (respuesta) {
      Navigator.pushNamed(context, '/medicine').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Se guardó la información"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("No se guardó la información"),
        backgroundColor: Colors.green,
      ));
    }
  }
}
