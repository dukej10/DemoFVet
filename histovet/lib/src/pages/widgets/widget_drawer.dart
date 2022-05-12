import 'package:flutter/material.dart';
import 'package:histovet/src/pages/clinicalHistory/clinicalhistory_page.dart';
import 'package:histovet/src/pages/medicine/medicine_page.dart';
import 'package:histovet/src/pages/medicine/consultar_medicamento.dart';
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
              leading: const Icon(Icons.medication),
              title: const Text("Medicines"),
              onTap: () {
                Navigator.pushNamed(context, MedicinePage.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search_rounded),
              title: const Text("Consultar Medicamento"),
              onTap: () {
                Navigator.pushNamed(context, ConsultarMedicamento.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.article_sharp ),
              title: const Text("Historias Clínicas"),
              onTap: () {
                Navigator.pushNamed(context, HistoryPage.id);
              },
            )
          ])
        ],
      ),
    );
  }
}
