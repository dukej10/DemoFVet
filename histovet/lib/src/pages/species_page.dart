import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  TextStyle txtStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 20);
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
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("specie").snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot breedSnap = snapshot.data!.docs[index];
                  return Card(
                    margin: EdgeInsets.all(6),
                    elevation: 6,
                    child: ListTile(
                        leading: Icon(FontAwesomeIcons.paw),
                        title: Text(breedSnap["name"], style: txtStyle),
                        subtitle: Text(breedSnap["code"],
                            style: txtStyle.copyWith(fontSize: 17))),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
