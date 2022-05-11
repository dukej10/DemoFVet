import '../../models/clinicalHistory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/services/clinicalHistory_service.dart';
import '../../controller/clinicalHistory_controller.dart';

class AddClinicalHistory extends StatefulWidget {
  static String id = "form_clinicalHistory";
  AddClinicalHistory({Key? key}) : super(key: key);

  @override
  State<AddClinicalHistory> createState() => _AddClinicalHistoryState();
}

class _AddClinicalHistoryState extends State<AddClinicalHistory> {
  final _formState = GlobalKey<FormBuilderState>();
  bool respuesta = false;
  ClinicalHistoryController clinicalHistorycont =
      new ClinicalHistoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Historial Clinico"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            getInfoHV();
          },
        ),
        body: FormBuilder(
            key: _formState,
            child: ListView(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
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
                        errorText: "La longitud del documento es de 4")
                  ]),
                ),
              ),
              Container(),
            ])));
  }

  getInfoHV() async {
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
      final phoneNumberOwner = values['phoneNumberOwner'];
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
      late ClinicalHistory clinicalHistory = new ClinicalHistory(
          "",
          numberClinicalHistory,
          date,
          time,
          docOwner,
          nameOwner,
          contactOwner,
          addressOwner,
          phoneNumberOwner,
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

      AddCH(clinicalHistory);
    }
  }

  void AddCH(ClinicalHistory clinicalHistory) async {
    respuesta = await clinicalHistorycont.addClinicalHistory(clinicalHistory);
    if (respuesta) {
      Navigator.pushNamed(context, '/clinicalHistories')
          .then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Se guardó la información de la historia clinica"),
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
