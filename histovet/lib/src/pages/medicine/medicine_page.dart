import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/controller/pet_controller.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/medicine/add_medicine.dart';
import 'package:histovet/src/pages/pet/pets_page.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';
import 'package:histovet/src/services/pet_service.dart';
import 'package:histovet/src/pages/pet/add_pets.dart';
import 'package:histovet/src/pages/pet/pet_update.dart';

import '../../controller/medicine_controller.dart';
import 'medicine_update.dart';

class MedicinePage extends StatefulWidget {
  static String id = "medicine_page";
  MedicinePage({Key? key}) : super(key: key);

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  TextStyle txtStyle =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black);
  MedicineController medicineCont = new MedicineController();
  bool respuesta = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Medicinas"),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          drawer: MenuLateral(),
          floatingActionButton: FloatingActionButton(
              child: Icon(FontAwesomeIcons.plus),
              elevation: 15.0,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, addMedicine.id);
              }),
          body: FutureBuilder(
              future: medicineCont.allMedicines(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return const Text('Error');
      } else if (snapshot.hasData) {
        List medicines = snapshot.data ?? [];
                return ListView(
                  children: [
                    for (Medicine medicine in medicines)
                      Card(
                        margin: EdgeInsets.all(6),
                        elevation: 6,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/img/fondo2.jpg'),
                                    fit: BoxFit.cover,
                                    ),),
                            child: ListTile(
                                onLongPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              updateMedicine(medicine.id.toString())));
                                },
                                leading: Icon(FontAwesomeIcons.kitMedical, color: Colors.black,),
                                title: Text(medicine.name, style: txtStyle,),
                                subtitle: Text(
                                  medicine.code,
                                  style: txtStyle.copyWith(fontSize: 17),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.black),
                                  onPressed: () {
                                    messageDelete(medicine.id.toString());
                                    Navigator.pushNamed(context, '/medicine')
                                        .then((_) => setState(() {}));
                                  },
                                ))),
                      )
                  ],
                );
      } else {
        return const Text('Empty data');
      }
    } else {
      return Text('State');
    }})),
    );
  }

  void messageDelete(String idMedicine) async {

    respuesta = await medicineCont.deleteMedicine(idMedicine);
    if (respuesta) {
      Navigator.pushNamed(context, '/medicine').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Se eliminó la medicina"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("No se pudo eliminar"),
        backgroundColor: Colors.green,
      ));
    }
  }

  
}
