import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/controller/pet_controller.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';
import 'package:histovet/src/services/pet_service.dart';
import 'package:histovet/src/pages/pet/add_pets.dart';
import 'package:histovet/src/pages/pet/pet_update.dart';

class PetsPage extends StatefulWidget {
  static String id = "pets_page";
  PetsPage({Key? key}) : super(key: key);

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  TextStyle txtStyle =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black);
  PetController petCont = new PetController();
  bool respuesta = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Mascotas"),
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
                Navigator.pushNamed(context, AddPet.id);
              }),
          body: FutureBuilder(
              future: petCont.allPets(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return const Text('Error');
      } else if (snapshot.hasData) {
        List species = snapshot.data ?? [];
                return ListView(
                  children: [
                    for (Pet specie in species)
                      Card(
                        margin: EdgeInsets.all(6),
                        elevation: 6,
                        child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/img/fondo.jpg'),
                                    fit: BoxFit.cover,
                                    ),),
                            child: ListTile(
                                onLongPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              updatePet(specie.id.toString())));
                                },
                                leading: Icon(FontAwesomeIcons.paw, color: Colors.black,),
                                title: Text(specie.name, style: txtStyle,),
                                subtitle: Text(
                                  specie.code,
                                  style: txtStyle.copyWith(fontSize: 17),
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.black),
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
    } else {
      return Text('State');
    }})),
    );
  }

  void messageDelete(String idPet) async {
    respuesta = await petCont.deletePet(idPet);
    if (respuesta) {
      Navigator.pushNamed(context, '/pets').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Se eliminó la mascota"),
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
