import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:histovet/src/pages/clinicalHistory/clinicalhistory_page.dart';
import 'package:histovet/src/pages/gps/home_screen.dart';
import 'package:histovet/src/pages/medicine/medicine_page.dart';
import 'package:histovet/src/pages/medicine/consultar_medicamento.dart';
import 'package:histovet/src/pages/pet/consultar_mascotas.dart';
import 'package:histovet/src/pages/pet/pets_page.dart';

import '../Home/home_page.dart';

// ignore: use_key_in_widget_constructors
class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/img/vet.png')),
                  const Text("HistoVet"),
                  const SizedBox(
                    height: 10.0,
                  )
                ],
              )),
          Column(children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_front_outlined),
              title: Text(user_name()),
            ),
             Container(height: 1, color: Colors.grey), 
            ListTile(
              leading: const Icon(Icons.house),
              title: const Text("Inicio"),
              onTap: () {
                Navigator.pushNamed(context, Home.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text("Mascotas"),
              onTap: () {
                Navigator.pushNamed(context, PetsPage.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search_rounded),
              title: const Text("Consultar Mascota"),
              onTap: () {
                Navigator.pushNamed(context, ConsultarMascota.id);
              },
            ),
            Visibility(
              visible: estado(),
              child: new ListTile(
                leading: const Icon(Icons.medication),
                title: const Text("Medicinas"),
                onTap: () {
                  Navigator.pushNamed(context, MedicinePage.id);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search_rounded),
              title: const Text("Consultar Medicamento"),
              onTap: () {
                Navigator.pushNamed(context, ConsultarMedicamento.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.article_sharp),
              title: const Text("Historias Clínicas"),
              onTap: () {
                Navigator.pushNamed(context, HistoryPage.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text("Mapa"),
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
            )
          ])
        ],
      ),
    );
  }
}

bool estado() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final uid = user?.uid;

  if (uid == '5Q5W4CWh9KUSz0J6uSuCxuhxZAm2') {
    //uid admin

    return true;
  } else {
    return false;
  }
}

String user_name() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  final name = user?.email;

  print(name);

  return name.toString();
}
