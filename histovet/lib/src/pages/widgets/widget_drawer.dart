import 'package:flutter/material.dart';
import 'package:histovet/src/pages/breeds_page.dart';
import 'package:histovet/src/pages/species_page.dart';

// ignore: use_key_in_widget_constructors
class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/img/vet.png')),
                  Text("HistoVet"),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              )),
          ListTile(
            leading: Icon(Icons.pets),
            title: Text("Raza"),
            onTap: () {
              Navigator.pushNamed(context, BreedsPage.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.pets),
            title: Text("Especie"),
            onTap: () {
              Navigator.pushNamed(context, SpeciesPage.id);
            },
          )
        ],
      ),
    );
  }
}
