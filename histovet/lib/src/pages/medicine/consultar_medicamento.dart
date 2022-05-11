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
  String _idMedic = "M001";
  String _nombre = "acetamin";
  int _cantidad = 2;
  double _precio = 10.0;
  String _fechaVencimiento = "12/12/2020";
  String _descripcion = "para dolores leves";
  double _espacio = 12;
  List<Medicine> _medicines = [];
  List datos = [];
  int _counter = 0;


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
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: _espacio,
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
            onPressed: () {getInfo(searchController.text);},
            child: Text('Solicitar'),
          ),
          SizedBox(
            height: _espacio,
          ),
          Container(
            height: 500,child:FutureBuilder(
              future: medService.searchMedicine("dsad"),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  print("Hay elementos");
                  List species = snapshot.data ?? [];
                  return ListView(
                    children: [
                      for (Medicine specie in species)
                        Card(
                          elevation: 6,
                          child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/fondo.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: ListTile(

                                  leading: Icon(
                                    FontAwesomeIcons.paw,
                                    color: Colors.black,
                                  ),
                                  title: Text(
                                    specie.name,

                                  ),
                                  subtitle: Text(
                                    specie.code
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      
                                    },
                                    icon:
                                        Icon(Icons.delete, color: Colors.black),
                                  ))),
                        )
                    ],
                  );
                } else {
                  return const Text('Empty data');
                }
              }))
          
        ],
      ),
    );
  }

  void getInfo(String text) async{
    print("Eescribió " + text);
    List<Medicine> medicines = await medService.searchMedicine("dsad");
  }
}
