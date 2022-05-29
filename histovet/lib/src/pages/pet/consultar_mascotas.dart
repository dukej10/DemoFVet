import 'package:flutter/material.dart';
import 'package:histovet/src/controller/medicine_controller.dart';
import 'package:histovet/src/controller/pet_controller.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/clinicalHistory/add_historypet.dart';
import 'package:histovet/src/pages/pet/pet_view.dart';
import 'package:histovet/src/services/pet_service.dart';
import 'package:histovet/src/pages/pet/pet_update.dart';

import '../../controller/sign_controller.dart';

class ConsultarMascota extends StatefulWidget {
  static String id = "consultar_mascota";
  const ConsultarMascota({Key? key}) : super(key: key);

  @override
  State<ConsultarMascota> createState() => _ConsultarMascotaState();
}

class _ConsultarMascotaState extends State<ConsultarMascota> {
  TextEditingController searchController = TextEditingController();
  MedicineController medCont = MedicineController();
  PetController petse = PetController();
  bool estado = false;
  SignController auth = SignController();

  @override
  void initState() {
    getEstado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultar mascota"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 15,
          top: 10,
          right: 15,
          bottom: 15,
        ),
        children: <Widget>[
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: searchController,
            maxLength: 4,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Ingrese el código de la mascota',
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 20,
            height: 30,
            child: ElevatedButton(
              child: const Text('Buscar'),
              onPressed: () {
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              padding: const EdgeInsets.only(
                left: 40,
                top: 20,
                right: 40,
                bottom: 20,
              ),
              height: 600,
              child: FutureBuilder(
                  future: petse.searchPet(searchController.text),
                  builder:
                      (BuildContext context, AsyncSnapshot<List> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      List pets = snapshot.data ?? [];
                      return ListView(
                        children: [
                          if (pets.isNotEmpty)
                            for (Pet pet in pets)
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image.network(
                                      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3017d4d2-d9ed-46e2-9cab-6e35f053b458/db0lgx1-ffc0f380-bb1c-4c92-88cf-e6621ef9e427.png/v1/fill/w_800,h_832,strp/dog_and_cat_png_by_dalidas_art_db0lgx1-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9ODMyIiwicGF0aCI6IlwvZlwvMzAxN2Q0ZDItZDllZC00NmUyLTljYWItNmUzNWYwNTNiNDU4XC9kYjBsZ3gxLWZmYzBmMzgwLWJiMWMtNGM5Mi04OGNmLWU2NjIxZWY5ZTQyNy5wbmciLCJ3aWR0aCI6Ijw9ODAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.y3hT_4CCfHt9EzHICQU-p8MWZOTeg2ZmjkxVFnc6pYM",
                                      height: 100,
                                    ),
                                    estado
                                        ? ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HistoryPetSelectPage(
                                                              pet.id
                                                                  .toString())));
                                            },
                                            icon: Icon(Icons.add_box_outlined),
                                            label: Text("Agregar historia"))
                                        : ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewPet(
                                                              pet.id.toString(),
                                                              pet.user_id
                                                                  .toString())));
                                            },
                                            icon: Icon(Icons.article_outlined),
                                            label: Text("Ver información")),
                                    estado
                                        ? ElevatedButton.icon(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewPet(
                                                              pet.id.toString(),
                                                              pet.user_id
                                                                  .toString())));
                                            },
                                            icon: Icon(Icons.article_outlined),
                                            label: Text("Ver información"))
                                        : const SizedBox(
                                            height: 1,
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Código: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + pet.code),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Nombre: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + pet.name),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Nombre dueño:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + pet.nameOwner),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Raza: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + pet.breed),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Sexo: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + pet.sex),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                          if (pets.isEmpty)
                            Column(
                              children: const [Text("No hay información")],
                            )
                        ],
                      );
                    } else {
                      return const Text('Empty data');
                    }
                  }))
        ],
      ),
    );
  }

  void getEstado() async {
    estado = await auth.estado();
    setState(() {});
  }
}
