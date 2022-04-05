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

  void showAddBreedModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: AddBreed(addBreedInDB));
        });
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
                  return ListTile(
                      leading: Icon(FontAwesomeIcons.paw),
                      title: Text(breedSnap["name"], style: txtStyle),
                      subtitle: Text(breedSnap["code"],
                          style: txtStyle.copyWith(fontSize: 17)));
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
