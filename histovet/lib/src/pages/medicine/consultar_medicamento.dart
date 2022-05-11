import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:histovet/src/controller/medicine_controller.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConsultarMedicamento extends StatefulWidget {
  static String id = "consultar_medicamento";
  ConsultarMedicamento({Key? key}) : super(key: key);

  @override
  State<ConsultarMedicamento> createState() => _ConsultarMedicamentoState();
}

class _ConsultarMedicamentoState extends State<ConsultarMedicamento> {
  TextEditingController searchController = TextEditingController();
  MedicineController medCont = MedicineController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultar medicamento"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          left: 15,
          top: 10,
          right: 15,
          bottom: 15,
        ),
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'nombre medicamento',
              //errorText: 'Error message',
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.search,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 20,
            height: 30,
            child: ElevatedButton(
              child: Text('Buscar'),
              onPressed: () {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              padding: const EdgeInsets.only(
                left: 40,
                top: 20,
                right: 40,
                bottom: 20,
              ),
              height: 500,
              child: FutureBuilder(
                  future: medCont.searchMedicine(searchController.text),
                  builder:
                      (BuildContext context, AsyncSnapshot<List> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      print("Hay elementos");
                      List medicines = snapshot.data ?? [];
                      return ListView(
                        children: [
                          if (medicines.length > 0)
                            for (Medicine medicine in medicines)
                              Container(
                                decoration: BoxDecoration(
    border: Border.all(color: Colors.blueAccent)
  ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Image.network(
                                      "https://previews.123rf.com/images/ylivdesign/ylivdesign1612/ylivdesign161200051/67085065-icono-de-vitaminas-o-medicamentos-para-animales-ilustraci%C3%B3n-de-dibujos-animados-de-vitaminas-o-medic.jpg?fj=1",
                                      height: 100,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("  Code: ", style: TextStyle(
fontWeight: FontWeight.bold)),
                                        Text(medicine.code),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("  Nombre: ",style: TextStyle(
fontWeight: FontWeight.bold) ),
                                        Text(medicine.name),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("  Precio: ", style: TextStyle(
fontWeight: FontWeight.bold)),
                                        Text(medicine.precio.toString()),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("  Fecha de vencimiento: ", style: TextStyle(
fontWeight: FontWeight.bold)),
                                        Text(medicine.fechaVen),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("  Descripcion: ", style: TextStyle(
fontWeight: FontWeight.bold)),
                                        Text(medicine.descripcion),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          if (medicines.length == 0)
                            Column(
                              children: [Text("No hay info")],
                            )
                        ],
                      );
                    } else {
                      // Agregar un Widget
                      return const Text('Empty data');
                    }
                  }))
        ],
      ),
    );
  }
}
