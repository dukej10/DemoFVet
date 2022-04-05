import 'package:flutter/material.dart';
import 'package:histovet/src/pages/add_breed.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';
import "package:path/path.dart" as Path;

class SpeciesPage extends StatefulWidget {
  static String id = "species_page";
  SpeciesPage({Key? key}) : super(key: key);

  @override
  State<SpeciesPage> createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage> {
  void showAddBreedModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets, child: AddBreed());
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
              showAddBreedModal();
            }),
      ),
    );
  }
}
