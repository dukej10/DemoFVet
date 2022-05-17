import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../controller/clinicalHistory_controller.dart';
import '../../models/clinicalHistory_model.dart';

class UpdateHistory extends StatefulWidget {
  static String id = "edit_history";
  final String idHistory;
  UpdateHistory(this.idHistory, {Key? key}) : super(key: key);

  @override
  State<UpdateHistory> createState() => _UpdateHistoryState();
}

class _UpdateHistoryState extends State<UpdateHistory> {
  final _formState = GlobalKey<FormBuilderState>();
  ClinicalHistoryController histCont = new ClinicalHistoryController();

  TextEditingController numberCHController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeCHController = TextEditingController();
  TextEditingController docOwnerCHController = TextEditingController();
  TextEditingController nameOwnerController = TextEditingController();
  TextEditingController contactOwnerController = TextEditingController();
  TextEditingController addressOwnerController = TextEditingController();
  TextEditingController emailAddressOwnerController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController specieController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController originController = TextEditingController();
  TextEditingController dietCHController = TextEditingController();
  TextEditingController previousIllnessesController = TextEditingController();
  TextEditingController previousSurgeriesController = TextEditingController();
  TextEditingController sterilizedController = TextEditingController();
  TextEditingController nAnimalBirthsController = TextEditingController();
  TextEditingController vaccinationScheduleController = TextEditingController();
  TextEditingController lastDewormingController = TextEditingController();
  TextEditingController recentTreatmentsController = TextEditingController();
  TextEditingController animalBehaviorController = TextEditingController();
  TextEditingController reasonForConsultationController =
      TextEditingController();
  TextEditingController physicalConditionController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController heartFrequencyController = TextEditingController();
  TextEditingController respiratoryFrequencyController =
      TextEditingController();
  TextEditingController tllcController = TextEditingController();
  TextEditingController pulseController = TextEditingController();
  TextEditingController trcpController = TextEditingController();
  TextEditingController percentageDehydrationController =
      TextEditingController();
  TextEditingController mucousController = TextEditingController();

  bool respuesta = false;

  // Text Editing Controller

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
                  controller: numberCHController,
                  name: "numberClinicalHistory",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Número de historia clinica",
                      hintText: "Ingrese el Número de historia clinica",
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
                        errorText:
                            "La longitud del número de historia cinica es de 4")
                  ]),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderTextField(
                      controller: dateController,
                      name: "date",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          labelText: "Fecha",
                          hintText: "Ingrese la fecha actual",
                          prefixIcon: Icon(Icons.date_range),
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
                      controller: timeCHController,
                      name: "time",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          labelText: "Hora",
                          hintText: "Ingrese la hora actual",
                          prefixIcon: Icon(Icons.timer),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      keyboardType: TextInputType.text,
                      maxLength: 6,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context,
                            errorText: "Valor requerido")
                      ]))),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: docOwnerCHController,
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
                  controller: nameOwnerController,
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
                  controller: contactOwnerController,
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
                  controller: addressOwnerController,
                  name: "addressOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Dirección",
                      hintText: "Ingrese la dirección de residencia",
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido")
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: emailAddressOwnerController,
                  name: "emailAddressOwner",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Correo electrónico",
                      hintText: "Ingrese el nombre del dueño",
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido")
                  ]),
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
                    controller: breedController,
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
                  controller: colorController,
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
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: weightController,
                  name: "weight",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Pesp(Kg)",
                      hintText: "Ingrese el peso de la mascota",
                      prefixIcon: Icon(Icons.monitor_weight_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                    FormBuilderValidators.min(context, 1,
                        errorText: "Debe ser un número mayor que 0"),
                    FormBuilderValidators.minLength(context, 3,
                        errorText: "La longitud del número es de 3")
                  ]),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: originController,
                  name: "origin",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Origen",
                      hintText: "Origen mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
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
                  controller: dietCHController,
                  name: "diet",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Dieta",
                      hintText: "Dieta de la mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 40,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: previousIllnessesController,
                  name: "previousIllnesses",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Enfermedades previas",
                      hintText: "Enfermedades previas",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: previousSurgeriesController,
                  name: "previousSurgeries",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "cirugías previas",
                      hintText: "Escriba enfermedades previas",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: sterilizedController,
                  name: "sterilized",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Esterilizado",
                      prefixIcon: Icon(Icons.pets),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 2,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: nAnimalBirthsController,
                    name: "nAnimalBirths",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Número de partos",
                        hintText: "Cuantos partos ha tenido la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: vaccinationScheduleController,
                  name: "vaccinationSchedule",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Vacunas",
                      hintText: "Escriba las vacunas que tiene la mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: lastDewormingController,
                  name: "lastDeworming",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Última desparasitación",
                      hintText: "Fecha última desparasitación",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 20,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: recentTreatmentsController,
                  name: "recentTreatments",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Tratamientos recientes",
                      hintText: "Escriba los tratamientos más recientes",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: animalBehaviorController,
                  name: "animalBehavior",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Comportamiento de la mascota",
                      hintText: "Escriba el comportamiento",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: reasonForConsultationController,
                  name: "reasonForConsultation",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Razón de la consulta",
                      hintText: "",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: physicalConditionController,
                  name: "physicalCondition",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Condición física",
                      hintText: "Condición física de la mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 200,
                  validator: FormBuilderValidators.required(context,
                      errorText: "Valor requerido"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: temperatureController,
                    name: "temperature",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Temperatura",
                        hintText: "Ingresa temperatura de la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.min(context, 0,
                          errorText: "La temperatura ser mayor o igual que 0")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: heartFrequencyController,
                    name: "heartFrequency",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Frecuencia cardíaca",
                        hintText: "Ingresa frecuencia cardíaca de la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: respiratoryFrequencyController,
                    name: "respiratoryFrequency",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Frecuencia respiratoria",
                        hintText:
                            "Ingresa frecuencia respiratoria de la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: tllcController,
                    name: "tllc",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Tiempo de llenado capilar(Seg)",
                        hintText: "Ingresa el tiempo de llenado capilar",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: pulseController,
                    name: "pulse",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Pulso",
                        hintText: "Ingresa el pulso de la mascota",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: trcpController,
                    name: "trcp",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Tiempo de recuperación del pliegue cutáneo",
                        hintText: "Ingresa el tiempo en segundos",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    controller: percentageDehydrationController,
                    name: "percentageDehydration",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: "Porcentaje deshidratación",
                        hintText: "Ingresa el porcentaje",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido")
                    ])),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  controller: mucousController,
                  name: "mucous",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      labelText: "Estado de la mucosa",
                      hintText: "Mucosa de la mascota",
                      prefixIcon: Icon(Icons.color_lens_outlined),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  maxLength: 50,
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
    getInfoClinicalHistory();
    super.initState();
  }

  getInfoPetPet() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;

      //Identificación historia clinica
      final numberClinicalHistory = values['numberCH'];
      final date = values['date'];
      final time = values['time'];

      //Datos del propietario
      final docOwner = values['docOwner'];
      final nameOwner = values['nameOwner'];
      final contactOwner = values['contactOwner'];
      final addressOwner = values['addressOwner'];
      final emailAddressOwner = values['emailAddressOwner'];

      //Reseña
      final name = values['name'];
      final specie = values['specie'];
      final breed = values['breed'];
      final sex = values['sex'];
      final color = values['color'];
      final weight = values['weight'];
      final origin = values['origin'];

      //Anamnesis
      final diet = values['diet'];
      final previousIllnesses = values['previousIllnesses'];
      final previousSurgeries = values['previousSurgeries'];
      final sterilized = values['sterilized'];
      final nAnimalBirths = values['nAnimalBirths'];
      final vaccinationSchedule = values['vaccinationSchedule'];
      final lastDeworming = values['lastDeworming'];
      final recentTreatments = values['recentTreatments'];
      final animalBehavior = values['animalBehavior'];
      final reasonForConsultation = values['reasonForConsultation'];

      //Examen fisico generaliz
      final physicalCondition = values['physicalCondition'];
      final temperature = values['temperature'];
      final heartFrequency = values['heartFrequency'];
      final respiratoryFrequency = values['respiratoryFrequency'];
      //tiempo de llena capilar: TLLC
      final tllc = values['tllc'];
      final pulse = values['pulse'];
      //tiempo de recuperación del pliegue cutáneo TRPC
      final trcp = values['trcp'];
      final percentageDehydration = values['percentageDehydration'];
      final mucous = values['mucous'];
      late ClinicalHistory clinicalHistory = ClinicalHistory(
          widget.idHistory,
          numberClinicalHistory,
          date,
          time,
          docOwner,
          nameOwner,
          contactOwner,
          addressOwner,
          emailAddressOwner,
          name,
          specie,
          breed,
          sex,
          color,
          weight,
          origin,
          diet,
          previousIllnesses,
          previousSurgeries,
          sterilized,
          nAnimalBirths,
          vaccinationSchedule,
          lastDeworming,
          recentTreatments,
          animalBehavior,
          reasonForConsultation,
          physicalCondition,
          temperature,
          heartFrequency,
          respiratoryFrequency,
          tllc,
          pulse,
          trcp,
          percentageDehydration,
          mucous);

      messageUpdate(clinicalHistory);
    }
  }

  void messageUpdate(ClinicalHistory clinicalHistory) async {
    respuesta = await histCont.updateClinicalHistory(clinicalHistory);
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

  void getInfoClinicalHistory() async {
    ClinicalHistory clinicalHistory =
        await histCont.getClinicalHistory(widget.idHistory);
    setState(() {
      numberCHController.text = clinicalHistory.numberCH.toString();
      dateController.text = clinicalHistory.date;
      timeCHController.text = clinicalHistory.time.toString();
      docOwnerCHController.text = clinicalHistory.docOwner;
      nameOwnerController.text = clinicalHistory.nameOwner;
      contactOwnerController.text = clinicalHistory.contactOwner;
      addressOwnerController.text = clinicalHistory.addressOwner;
      emailAddressOwnerController.text = clinicalHistory.emailAddressOwner;
      nameController.text = clinicalHistory.name;
      specieController.text = clinicalHistory.specie;
      breedController.text = clinicalHistory.breed;
      sexController.text = clinicalHistory.sex;
      colorController.text = clinicalHistory.color;
      weightController.text = clinicalHistory.weight.toString();
      originController.text = clinicalHistory.origin;
      dietCHController.text = clinicalHistory.diet;
      previousIllnessesController.text = clinicalHistory.previousIllnesses;
      previousSurgeriesController.text = clinicalHistory.previousSurgeries;
      sterilizedController.text = clinicalHistory.sterilized;
      nAnimalBirthsController.text = clinicalHistory.nAnimalBirths.toString();
      vaccinationScheduleController.text = clinicalHistory.vaccinationSchedule;
      lastDewormingController.text = clinicalHistory.lastDeworming;
      recentTreatmentsController.text = clinicalHistory.recentTreatments;
      animalBehaviorController.text = clinicalHistory.animalBehavior;
      reasonForConsultationController.text =
          clinicalHistory.reasonForConsultation;
      physicalConditionController.text = clinicalHistory.physicalCondition;
      temperatureController.text = clinicalHistory.temperature.toString();
      heartFrequencyController.text = clinicalHistory.heartFrequency.toString();
      respiratoryFrequencyController.text =
          clinicalHistory.respiratoryFrequency.toString();
      tllcController.text = clinicalHistory.tllc.toString();
      pulseController.text = clinicalHistory.pulse.toString();
      trcpController.text = clinicalHistory.trcp.toString();
      percentageDehydrationController.text =
          clinicalHistory.percentageDehydration.toString();
      mucousController.text = clinicalHistory.mucous.toString();
    });
  }
}
