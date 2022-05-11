import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:histovet/src/models/medicine_model.dart';
import 'package:histovet/src/services/medicine_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConsultarMedicamento extends StatefulWidget {
  static String id = "consultar_medicamento";
  ConsultarMedicamento({Key? key}) : super(key: key);

  @override
  State<ConsultarMedicamento> createState() => _ConsultarMedicamentoState();
}

class _ConsultarMedicamentoState extends State<ConsultarMedicamento> {
  TextEditingController searchController = TextEditingController();
  MedicineService medService = MedicineService();

  void getListMedicamentos() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("medicine");
    QuerySnapshot listMedicam = await collectionReference.get();
    if (listMedicam.docs.isNotEmpty) {
      for (var doc in listMedicam.docs) {
        //print(doc.data());
        datos.add(doc.data());
      }
    }
    //print(datos.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListMedicamentos();
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
          ElevatedButton(
            
            child: Text('Solicitar'),
            onPressed: () {
                setState(() {});
              },
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
    ) ,
              height: 500,
              child: FutureBuilder(
                  future: medService.searchMedicine(searchController.text),
                  builder:
                      (BuildContext context, AsyncSnapshot<List> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      print("Hay elementos");
                      List medicines = snapshot.data ?? [];
                      return ListView(
                        children: [
                          if (medicines.length>0) 
                          for (Medicine medicine in medicines)
                              Column(
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
                                    Text("id: "),
                                    Text(medicine.code),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("nombre: "),
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
                                    Text("Precio: "),
                                    Text(medicine.precio.toString()),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("fecha de vencimiento: "),
                                    Text(medicine.fechaVen),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text("descripcion: "),
                                    Text(medicine.descripcion),
                                  ],
                                ),
                              ],
                            ),
                            if (medicines.length == 0) 
                            Column(
                              children: [Text("No hay info")],
                            )  
                                                      
                        ]
                        
                        ,
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

  void getInfo(String text) async {
    print("Eescribió " + text);
  }
}
