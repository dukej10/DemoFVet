import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:histovet/src/services/pet_service.dart';

import '../../controller/pet_controller.dart';
import '../../models/pet_model.dart';


class addPet extends StatefulWidget {
  static String id = "form_pet";
  addPet({Key? key}) : super(key: key);

  @override
  State<addPet> createState() => _addPetState();
}

class _addPetState extends State<addPet> {
  final PetService _service = PetService();
  final _formState = GlobalKey<FormBuilderState>();
  bool respuesta = false;
  PetController petCont = new PetController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Registrar mascota"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          getInfoPet();
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
                      hintText: "Ingrese el código de la mascotas",
                      prefixIcon: Icon(Icons.numbers),
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
                          hintText: "Ingrese el nombre de la mascotas",
                          prefixIcon: Icon(Icons.pets),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.text,
                      maxLength: 10,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ]))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  name: "nameOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Nombre Dueño",
                      hintText: "Ingrese el nombre del dueño",
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.text,
                  maxLength: 10,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido")
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  name: "contactOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "contacto Dueño",
                      hintText: "Ingrese el contacto del dueño",
                      prefixIcon: Icon(Icons.contact_phone_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                    FormBuilderValidators.integer(context,
                        errorText: "No puede tener decimales"),
                    FormBuilderValidators.min(context, 1,
                        errorText: "Debe ser un número mayor que 0"),
                    FormBuilderValidators.minLength(context, 10,
                        errorText: "La longitud del número es de 10")
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    name: "docOwner",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Documento Dueño",
                        hintText: "Ingrese el documento del dueño",
                        prefixIcon: Icon(Icons.badge_outlined),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.minLength(context, 10,
                          errorText: "La longitud del documento es de 10"),
                      FormBuilderValidators.integer(context,
                          errorText: "No puede tener decimales"),
                      FormBuilderValidators.min(context, 1,
                          errorText: "Debe ser un número mayor que 0"),
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  name: "age",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Edad",
                      hintText: "Ingresa la edad de la mascotas",
                      prefixIcon: Icon(Icons.numbers),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    name: "breed",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Raza",
                        hintText: "Ingrese la raza de la mascotas",
                        prefixIcon: Icon(Icons.pets),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    maxLength: 10,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
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
                          errorText: "Seleccione un sexo para la mascota"),
                      items: [
                        {'value': 'Macho', 'key': 'Macho'},
                        {'value': 'Hembra', 'key': 'Hembra'}
                      ]
                          .map((sex) => DropdownMenuItem(
                              value: sex["value"],
                              child: Text("${sex["value"]}")))
                          .toList())),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderDropdown(
                    name: "subespecie",
                    decoration: InputDecoration(
                        labelText: "Subespecie",
                        prefixIcon: Icon(Icons.article_outlined),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    hint: Text("Seleccionar subespecie para la mascota"),
                    validator: FormBuilderValidators.required(context,
                        errorText: "Seleccione una subespecie"),
                    items: [
                      {'value': 'Perro', 'key': 'Perro'},
                      {'value': 'Gato', 'key': 'Gato'}
                    ]
                        .map((subespecie) => DropdownMenuItem(
                            value: subespecie["value"],
                            child: Text("${subespecie["value"]}")))
                        .toList()),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  name: "color",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Color",
                      hintText: "Ingrese el color de la mascotas",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              )
            ],
          )),
    );
  }

  getInfoPet() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      final code = values['code'];
      final name = values['name'];
      final docOwner = values['docOwner'];
      final nameOwner = values['nameOwner'];
      final contactOwner = values['contactOwner'];
      final age = int.parse(values['age']);
      final breed = values['breed'];
      final specie = values['subespecie'];
      final color = values['color'];
      final sex = values['sex'];
      late Pet pet = new Pet("", code, name, nameOwner, contactOwner, docOwner,
          age, breed, specie, color, sex);
      addPet(pet);
    }
  }

  void addPet(Pet pet) async {
    respuesta = await petCont.addPet(pet);
    if (respuesta) {
      Navigator.pushNamed(context, '/pets').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Se guardóo la información"),
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
