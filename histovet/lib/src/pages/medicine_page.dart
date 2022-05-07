import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/controller/pet_controller.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/add_medicine.dart';
import 'package:histovet/src/pages/pet/pets_page.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';
import 'package:histovet/src/services/pet_service.dart';
import 'package:histovet/src/pages/pet/add_pets.dart';
import 'package:histovet/src/pages/pet/pet_update.dart';

import '../controller/medicine_controller.dart';
import '../services/medicine_service.dart';

class MedicinePage extends StatefulWidget {
  static String id = "medicine_page";
  MedicinePage({Key? key}) : super(key: key);

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  final MedicinePage _service = MedicinePage();

  TextStyle txtStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 20);
  MedicineController petCont = new MedicineController();

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Medicina"),
            actions: [IconButton(onPressed: () {setState(() {
              });
            }, icon: const Icon(Icons.refresh))],
          ),
          drawer: MenuLateral(),
          floatingActionButton: FloatingActionButton(
              child: Icon(FontAwesomeIcons.plus),
              elevation: 15.0,
              backgroundColor: Colors.blue,
              onPressed: () {Navigator.pushNamed(context, addMedicine.id);}),
              body: FutureBuilder(
            future: MedicineService().getMedicines(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              List medicine = snapshot.data ?? [];
              return ListView(
                children: [
                  for (Medicine m in medicine)
                    Card(
                      margin: EdgeInsets.all(6),
                      elevation: 6,
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.kitMedical),
                        title: Text(m.name, style: txtStyle),
                        subtitle: Text(
                          m.code,
                          style: txtStyle.copyWith(fontSize: 17),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: (){
                            petCont.deletePet(m.id);
                                      Navigator.pushNamed(context, '/medicine').then((_) => setState(() {}));
                          },
                        )
                      ),
                    )
                ],
              );
            })),
    );
  }
}
