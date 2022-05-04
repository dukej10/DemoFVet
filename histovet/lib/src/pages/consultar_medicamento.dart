import 'package:flutter/material.dart';

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

  int _counter = 0;
  void listarMedicamentos() {
    setState(() {
      _idMedic = "Listar medicamentos";
    });
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
