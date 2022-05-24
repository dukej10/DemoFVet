import 'package:flutter/material.dart';
import 'package:histovet/src/controller/medicine_controller.dart';
import 'package:histovet/src/controller/pet_controller.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/clinicalHistory/add_historypet.dart';
import 'package:histovet/src/services/pet_service.dart';

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

  @override
  void initState() {
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
            decoration: const InputDecoration(
              labelText: 'Ingrese el código de la mascota',
              //errorText: 'Error message',
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
              padding: const EdgeInsets.only(
                left: 40,
                top: 20,
                right: 40,
                bottom: 20,
              ),
              height: 500,
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
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Image.network(
                                      "https://previews.123rf.com/images/ylivdesign/ylivdesign1612/ylivdesign161200051/67085065-icono-de-vitaminas-o-medicamentos-para-animales-ilustraci%C3%B3n-de-dibujos-animados-de-vitaminas-o-medic.jpg?fj=1",
                                      height: 100,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HistoryPetSelectPage(
                                                          pet.id.toString())));
                                        },
                                        child: Text("Agregar historia")),
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
}
