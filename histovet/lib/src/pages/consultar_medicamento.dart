import 'package:flutter/material.dart';

class ConsultarMedicamento extends StatefulWidget {
  static String id = "consultar_medicamento";
  ConsultarMedicamento({Key? key}) : super(key: key);

  @override
  State<ConsultarMedicamento> createState() => _ConsultarMedicamentoState();
}

class _ConsultarMedicamentoState extends State<ConsultarMedicamento> {
  String _valor = "";
  int _counter = 0;
  void listarMedicamentos() {
    print("Listar medicamentos");
    setState(() {
      _valor = "Listar medicamentos";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultar medicamento"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_valor',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: Text("Listar medicamentos"),
              onPressed: listarMedicamentos,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
