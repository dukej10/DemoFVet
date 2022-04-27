import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/models/pet_model.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';
import 'package:histovet/src/services/pet_service.dart';

class PetsPage extends StatefulWidget {
  static String id = "pets_page";
  PetsPage({Key? key}) : super(key: key);

  @override
  State<PetsPage> createState() => _PetsPageState();
}

class _PetsPageState extends State<PetsPage> {
  final PetService _service = PetService();
  TextStyle txtStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Mascotas"),
          ),
          drawer: MenuLateral(),
          floatingActionButton: FloatingActionButton(
              child: Icon(FontAwesomeIcons.plus),
              elevation: 15.0,
              backgroundColor: Colors.blue,
              onPressed: () {}),
              body: FutureBuilder(
            future: PetService().getPets(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              List species = snapshot.data ?? [];
              return ListView(
                children: [
                  for (Pet specie in species)
                    Card(
                      margin: EdgeInsets.all(6),
                      elevation: 6,
                      child: ListTile(
                        onLongPress: () {},
                        leading: Icon(FontAwesomeIcons.paw),
                        title: Text(specie.name, style: txtStyle),
                        subtitle: Text(
                          specie.code,
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
                                      print(specie.id);
                                    })
                              ],
                            ))
                          ],
                        ),
                      ),
                    )
                ],
              );
            })),
    );
  }
}
