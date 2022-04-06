import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/pages/add_breed.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';
import 'package:histovet/src/services/FirebaseService.dart';

import '../models/breed_model.dart';

class BreedsPage extends StatefulWidget {
  static String id = "breeds_page";

  @override
  State<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {
  final FirebaseService _service = FirebaseService();

  void addBreedInDB(Breed breed) {
    _service.storeBreedToFirebase(breed).whenComplete(() {
      Navigator.of(context).pop();
    });
  }

  void updateBreed(Breed breed) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: AddBreed(addBreedInDB, breed));
        });
  }

  void showAddBreedModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: AddBreed(addBreedInDB, null));
        });
  }

  void deleteBreed(breedId) {
    _service.deleteBreedFromFirebase(breedId);
  }

  TextStyle txtStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Razas"),
        ),
        drawer: MenuLateral(),
        floatingActionButton: FloatingActionButton(
            child: Icon(FontAwesomeIcons.plus),
            elevation: 15.0,
            backgroundColor: Colors.blue,
            onPressed: () {
              showAddBreedModal();
            }),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("breed").snapshots(),
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
                      onLongPress: () {
                        updateBreed(Breed(breedSnap["id"], breedSnap["code"],
                            breedSnap["name"]));
                      },
                      leading: Icon(FontAwesomeIcons.paw),
                      title: Text(breedSnap["name"], style: txtStyle),
                      subtitle: Text(
                        breedSnap["code"],
                        style: txtStyle.copyWith(fontSize: 17),
                      ),
                      trailing: Column(
                        children: [
                          Expanded(
                              child: PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                  child: Text('Eliminar'),
                                  onTap: () {
                                    deleteBreed(breedSnap["id"]);
                                  })
                            ],
                          ))
                        ],
                      ),
                    ),
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
