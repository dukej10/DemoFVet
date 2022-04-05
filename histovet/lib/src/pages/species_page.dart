import 'package:flutter/material.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';

class SpeciesPage extends StatefulWidget {
  static String id = "species_page";
  SpeciesPage({Key? key}) : super(key: key);

  @override
  State<SpeciesPage> createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Especies"),
        ),
        drawer: MenuLateral(),
      ),
    );
  }
}
