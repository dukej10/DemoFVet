import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../controller/pet_controller.dart';
import '../../models/pet_model.dart';

class UpdatePet extends StatefulWidget {
  static String id = "edit_pet";
  final String idPet;
<<<<<<< HEAD
  updatePet(this.idPet, {Key? key}) : super(key: key);
=======
  UpdatePet(this.idPet, {Key? key}) : super(key: key);
>>>>>>> 8f00993c739cbde37d8a4fc21dc13da6a4e29918

  @override
  State<UpdatePet> createState() => _UpdatePet();
}

class _UpdatePet extends State<UpdatePet> {
  final _formState = GlobalKey<FormBuilderState>();
  PetController petCont = new PetController();

  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController nownerController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController docController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController specieController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController sexController = TextEditingController();

  bool respuesta = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Editar Información Mascota"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          getInfoPetPet();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
<<<<<<< HEAD
                  controller: codeController,
                  name: "code",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Código",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
=======
                    controller: codeController,
                    name: "code",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Código",
                        prefixIcon: Icon(Icons.pets),
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
                    ])),
>>>>>>> 8f00993c739cbde37d8a4fc21dc13da6a4e29918
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: nameController,
                  name: "name",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Nombre",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: nownerController,
                  name: "nameOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Nombre Dueño",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: contactController,
                  name: "contactOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "contacto Dueño",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
<<<<<<< HEAD
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
=======
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
>>>>>>> 8f00993c739cbde37d8a4fc21dc13da6a4e29918
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
<<<<<<< HEAD
                  controller: docController,
                  name: "docOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Documento Dueño",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
=======
                    controller: docController,
                    name: "docOwner",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Documento Dueño",
                        prefixIcon: Icon(Icons.pets),
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
>>>>>>> 8f00993c739cbde37d8a4fc21dc13da6a4e29918
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
<<<<<<< HEAD
                  controller: ageController,
                  name: "age",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Edad",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
=======
                    controller: ageController,
                    name: "age",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Edad",
                        prefixIcon: Icon(Icons.pets),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.min(context, 0,
                          errorText: "La edad debe ser mayor o igual que 0")
                    ])),
>>>>>>> 8f00993c739cbde37d8a4fc21dc13da6a4e29918
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: breedController,
                  name: "breed",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Raza",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: sexController,
                  name: "sex",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Sexo",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: specieController,
                  name: "specie",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Subespecie",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 10,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: colorController,
                  name: "color",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Color",
                      prefixIcon: Icon(Icons.pets),
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

  @override
  void initState() {
    getInfoPet();
    super.initState();
  }

  // Se encarga de obtener los datos que el usuario ingresó
  getInfoPetPet() async {
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
      final specie = values['specie'];
      final color = values['color'];
      final sex = values['sex'];
      late Pet pet = new Pet(widget.idPet, code, name, nameOwner, contactOwner,
          docOwner, age, breed, specie, color, sex);
<<<<<<< HEAD
      updatePet(pet);
    }
  }

  void updatePet(Pet pet) async {
=======
      messageUpdate(pet);
    }
  }

  // Le indica al usuario si se pudo o no actualizar la información de la mascota
  void messageUpdate(Pet pet) async {
>>>>>>> 8f00993c739cbde37d8a4fc21dc13da6a4e29918
    respuesta = await petCont.updatePet(pet);
    if (respuesta) {
      Navigator.pushNamed(context, '/pets').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Se actualizó la información"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("No se actualizó la información"),
        backgroundColor: Colors.green,
      ));
    }
  }

<<<<<<< HEAD
  void getInfo() async {
    // await _service.getPet(widget.idPet);
=======
  /// Obtiene la información de la mascota a la cual se quiere
  /// cambiar su información
   
  void getInfoPet() async {
>>>>>>> 8f00993c739cbde37d8a4fc21dc13da6a4e29918
    Pet pet = await petCont.getPet(widget.idPet);
    setState(() {
      codeController.text = pet.code.toString();
      nameController.text = pet.name;
      nownerController.text = pet.nameOwner;
      contactController.text = pet.contactOwner;
      docController.text = pet.documentOwner;
      ageController.text = pet.age.toString();
      breedController.text = pet.breed;
      specieController.text = pet.specie;
      colorController.text = pet.color;
      sexController.text = pet.sex;
    });
  }
}
