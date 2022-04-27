import 'package:flutter/material.dart';
import 'package:histovet/src/pages/add_pets.dart';

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
            title: Text("AddPet"),
            onTap: () {
              Navigator.pushNamed(context, addPet.id);
            },
          ),
          
        ],
      ),
    );
  }
}
