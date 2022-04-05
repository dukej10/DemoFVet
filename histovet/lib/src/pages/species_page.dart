import 'package:flutter/material.dart';
import 'package:histovet/src/models/specie_model.dart';
import 'package:histovet/src/pages/add_breed.dart';
import 'package:histovet/src/pages/add_species.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';
import 'package:histovet/src/services/FirebaseService.dart';
import "package:path/path.dart" as Path;

class SpeciesPage extends StatefulWidget {
  static String id = "species_page";
  SpeciesPage({Key? key}) : super(key: key);

  @override
  State<SpeciesPage> createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage> {
  final FirebaseService _service = FirebaseService();

  void addSpecieInDB(Specie specie) {
    _service.storeSpecieToFirebase(specie).whenComplete(() {
      Navigator.of(context).pop();
    });
  }

  void showAddSpecieModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: AddSpecie(addSpecieInDB));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Especies"),
        ),
        drawer: MenuLateral(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showAddSpecieModal();
            }),
      ),
    );
  }
}
