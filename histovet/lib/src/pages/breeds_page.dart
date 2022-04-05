import 'package:flutter/material.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';

class BreedsPage extends StatefulWidget {
  static String id = "breeds_page";

  const BreedsPage({Key? key}) : super(key: key);
  @override
  State<BreedsPage> createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Razas"),
        ),
        drawer: MenuLateral(),
      ),
    );
  }
}
