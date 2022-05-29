import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:histovet/src/pages/Login/signin_screen.dart';
import 'package:histovet/src/pages/clinicalHistory/clinicalhistory_page.dart';
import 'package:histovet/src/pages/clinicalHistory/consultar_histories.dart';
import 'package:histovet/src/pages/gps/home_screen.dart';
import 'package:histovet/src/pages/medicine/medicine_page.dart';
import 'package:histovet/src/pages/medicine/consultar_medicamento.dart';
import 'package:histovet/src/pages/pet/consultar_mascotas.dart';
import 'package:histovet/src/pages/pet/pets_page.dart';

import '../../controller/sign_controller.dart';
import '../Home/home_page.dart';

// ignore: use_key_in_widget_constructors
class MenuLateral extends StatefulWidget {
  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  SignController sign = SignController();
  String username = "";
  bool estado = false;
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
              title: Text(username.toString()),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_front_outlined),
              title: Text("Cerrar sesión"),
              onTap: () {
                messageOut();
              },
            ),
            Container(height: 1, color: Colors.grey),
            ListTile(
              leading: const Icon(Icons.house),
              title: const Text("Inicio"),
              onTap: () {
                Navigator.pushNamed(context, Home.id);
              },
            ),
            Visibility(
              visible: estado,
              child: ListTile(
                leading: const Icon(Icons.pets),
                title: const Text("Mascotas"),
                onTap: () {
                  Navigator.pushNamed(context, PetsPage.id);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search_rounded),
              title: const Text("Consultar Mascota"),
              onTap: () {
                Navigator.pushNamed(context, ConsultarMascota.id);
              },
            ),
            Visibility(
              visible: estado,
              child: ListTile(
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
            Visibility(
              visible: estado,
              child: ListTile(
                leading: const Icon(Icons.article_sharp),
                title: const Text("Historias Clínicas"),
                onTap: () {
                  Navigator.pushNamed(context, HistoryPage.id);
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.content_paste_search_rounded),
              title: const Text("Buscar Historias Clínicas"),
              onTap: () {
                Navigator.pushNamed(context, ConsultarHistories.id);
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

  void messageOut() async {
    bool answer = await sign.signOut();

    if (answer) {
      print("CERRAR");
      Navigator.pushNamed(context, SignIn.id);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Se cerró sesión"),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No se pudo cerrar sesión"),
        backgroundColor: Colors.green,
      ));
    }
  }

  @override
  void initState() {
    getUsername();
    getEstado();
    super.initState();
  }

  void getUsername() async {
    username = await sign.username();
    print("tengo " + username);
    setState(() {});
  }

  void getEstado() async {
    estado = await sign.estado();
    setState(() {});
  }
}
