import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/controller/pet_controller.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';
import 'package:histovet/src/pages/pet/add_pets.dart';
import 'package:histovet/src/pages/pet/pet_update.dart';

class PetsPage extends StatefulWidget {
  static String id = "pets_page";
  const PetsPage({Key? key}) : super(key: key);

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  TextStyle txtStyle =
      const TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black);
  PetController petCont = PetController();
  bool answer = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Mascotas"),
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
              child: const Icon(FontAwesomeIcons.plus),
              elevation: 15.0,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, AddPet.id);
              }),
          body: FutureBuilder(
              future: petCont.allPets(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  List species = snapshot.data ?? [];
                  return ListView(
                    children: [
                      for (Pet specie in species)
                        Card(
                          margin: const EdgeInsets.all(6),
                          elevation: 6,
                          child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/fondo.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: ListTile(
                                  onLongPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UpdatePet(
                                                specie.id.toString())));
                                  },
                                  leading: const Icon(
                                    FontAwesomeIcons.paw,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    specie.name,
                                    style: txtStyle,
                                  ),
                                  subtitle: Text(
                                    specie.code,
                                    style: txtStyle.copyWith(fontSize: 17),
                                  ),
                                  trailing: IconButton(
                                    icon:
                                        const Icon(Icons.delete, color: Colors.black),
                                    onPressed: () {
                                      messageDelete(specie.id.toString());
                                      Navigator.pushNamed(context, '/pets')
                                          .then((_) => setState(() {}));
                                    },
                                  ))),
                        )
                    ],
                  );
                } else {
                  return const Text('Empty data');
                }
              })),
    );
  }

  // Le indica al usuario si se pudo o no eliminar el registro
  void messageDelete(String idPet) async {
    answer = await petCont.deletePet(idPet);
    if (answer) {
      Navigator.pushNamed(context, '/pets').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se eliminó la mascota"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se pudo eliminar"),
        backgroundColor: Colors.green,
      ));
    }
  }
}
