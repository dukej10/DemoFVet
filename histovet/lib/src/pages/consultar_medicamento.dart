import 'package:flutter/material.dart';

class ConsultarMedicamento extends StatefulWidget {
  static String id = "consultar_medicamento";
  ConsultarMedicamento({Key? key}) : super(key: key);

  @override
  State<ConsultarMedicamento> createState() => _ConsultarMedicamentoState();
}

class _ConsultarMedicamentoState extends State<ConsultarMedicamento> {
  String _valor = "";
  void listarMedicamentos() {
    print("Listar medicamentos");
    setState(() {
      _valor = "Listar medicamentos";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
