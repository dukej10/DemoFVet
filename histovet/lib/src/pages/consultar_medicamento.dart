import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:histovet/src/models/medicine_model.dart';

class ConsultarMedicamento extends StatefulWidget {
  static String id = "consultar_medicamento";
  ConsultarMedicamento({Key? key}) : super(key: key);

  @override
  State<ConsultarMedicamento> createState() => _ConsultarMedicamentoState();
}

class _ConsultarMedicamentoState extends State<ConsultarMedicamento> {
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
  String buscarMedicine = "";

  void getListMedicamentos() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("medicine");
    QuerySnapshot listMedicam = await collectionReference.get();
    if (listMedicam.docs.isNotEmpty) {
      for (var doc in listMedicam.docs) {
        //print(doc.data());
        datos.add(doc.data());
      }
      //print(datos.toString());
    }
  }

  void addListmedicine() {
    for (var medic in datos) {
      _medicines.add(Medicine(medic["id"], medic["code"], medic["name"],
          medic["descripcion"], medic["grupo"]));
    }
    print(_medicines.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListMedicamentos();
    addListmedicine();
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
          TextFormField(
            initialValue: '',
            decoration: InputDecoration(
              labelText: 'nombre medicamento',
              //errorText: 'Error message',
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.search,
              ),
            ),
            onSaved: (value) {
              buscarMedicine = value != null ? value : 'nada';
            },
          ),
          ElevatedButton(
            onPressed: () {
              print(buscarMedicine);
            },
            child: Text('Solicitar'),
          ),
          SizedBox(
            height: _espacio,
          ),
          Image.network(
            "https://previews.123rf.com/images/ylivdesign/ylivdesign1612/ylivdesign161200051/67085065-icono-de-vitaminas-o-medicamentos-para-animales-ilustraci%C3%B3n-de-dibujos-animados-de-vitaminas-o-medic.jpg?fj=1",
            height: 100,
          ),
          SizedBox(
            height: _espacio,
          ),
          Row(
            children: [
              Text("id: "),
              Text(_idMedic),
            ],
          ),
          SizedBox(
            height: _espacio,
          ),
          Row(
            children: [
              Text("nombre: "),
              Text(_nombre),
            ],
          ),
          SizedBox(
            height: _espacio,
          ),
          Row(
            children: [
              Text("cantidad: "),
              Text(_cantidad.toString()),
            ],
          ),
          SizedBox(
            height: _espacio,
          ),
          Row(
            children: [
              Text("Precio: "),
              Text(_precio.toString()),
            ],
          ),
          SizedBox(
            height: _espacio,
          ),
          Row(
            children: [
              Text("fecha de vencimiento: "),
              Text(_fechaVencimiento),
            ],
          ),
          SizedBox(
            height: _espacio,
          ),
          Row(
            children: [
              Text("descripcion: "),
              Text(_descripcion),
            ],
          ),
        ],
      ),
    );
  }
}
