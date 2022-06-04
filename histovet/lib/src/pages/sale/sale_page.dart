import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:histovet/src/controller/sale_controller.dart';
import 'package:histovet/src/models/sale_model.dart';
import 'package:histovet/src/pages/widgets/widget_drawer.dart';
import 'package:histovet/src/pages/sale/add_sale.dart';
// import 'package:histovet/src/pages/pet/pet_update.dart';

class SalesPage extends StatefulWidget {
  static String id = "sales_page";
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPAgeState();
}

class _SalesPAgeState extends State<SalesPage> {
  TextStyle txtStyle = const TextStyle(
      fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black);
  SaleController saleController = SaleController();
  bool answer = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Ventas"),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          drawer: MenuLateral(),
          floatingActionButton: FloatingActionButton(
              child: const Icon(FontAwesomeIcons.plus),
              elevation: 15.0,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, AddSale.id);
              }),
          body: FutureBuilder(
              future: saleController.allSales(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  List sales = snapshot.data ?? [];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        for (Sale sale in sales)
                          Card(
                            margin: const EdgeInsets.all(6),
                            elevation: 6,
                            // child: Container(
                            //     decoration: const BoxDecoration(
                            //       image: DecorationImage(
                            //         image: AssetImage('assets/img/fondo.jpg'),
                            //         fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //     child: ListTile(
                            //         onLongPress: () {
                            //           Navigator.push(
                            //               context,
                            //               MaterialPageRoute(
                            //                   builder: (context) => UpdatePet(
                            //                       specie.id.toString(),
                            //                       specie.user_id.toString())));
                            //         },
                            //         leading: const Icon(
                            //           FontAwesomeIcons.paw,
                            //           color: Colors.black,
                            //         ),
                            //         title: Text(
                            //           specie.name,
                            //           style: txtStyle,
                            //         ),
                            //         subtitle: Text(
                            //           specie.code,
                            //           style: txtStyle.copyWith(fontSize: 17),
                            //         ),
                            //         trailing: IconButton(
                            //           icon: const Icon(Icons.delete,
                            //               color: Colors.black),
                            //           onPressed: () {
                            //             messageDelete(specie.id.toString());
                            //             Navigator.pushNamed(context, '/pets')
                            //                 .then((_) => setState(() {}));
                            //           },
                            //         ))),
                          )
                      ],
                    ),
                  );
                } else {
                  return const Text('Empty data');
                }
              })),
    );
  }

  // Le indica al usuario si se pudo o no eliminar el registro

}
