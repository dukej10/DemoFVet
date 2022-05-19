import 'package:flutter/material.dart';
import 'package:histovet/src/controller/medicine_controller.dart';
import 'package:histovet/src/models/medicine_model.dart';

class ConsultarMedicamento extends StatefulWidget {
  static String id = "consultar_medicamento";
  const ConsultarMedicamento({Key? key}) : super(key: key);

  @override
  State<ConsultarMedicamento> createState() => _ConsultarMedicamentoState();
}

class _ConsultarMedicamentoState extends State<ConsultarMedicamento> {
  String _code = "M001";
  String _name = "acetamin";
  int _cantidad = 2;
  double _precio = 10.0;
  String _fechaVen = "12/12/2020";
  String _description = "para dolores leves";

  List<Medicine> _medicines = [];
  double _espacio = 12;

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

  /*void addListmedicine() {
    for (var medic in datos) {
      _medicines.add(Medicine(medic["id"], medic["code"], medic["name"],
          medic["descripcion"], medic["grupo"]));
    }
    print(_medicines.toString());
  }*/

  @override
  void initState() {
    super.initState();
    getListMedicamentos();
    //addListmedicine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consultar medicamento"),
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
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: searchController,
            decoration: const InputDecoration(
              labelText: 'Ingrese el nombre del medicamento',
              //errorText: 'Error message',
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.search,
              ),
            ),
            onSaved: (value) {
              buscarMedicine = value!;
            },
          ),
          ElevatedButton(
            onPressed: () {
              print(buscarMedicine);
            },
            child: Text('Solicitar'),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 20,
            height: 30,
            child: ElevatedButton(
              child: const Text('Buscar'),
              onPressed: () {
                setState(() {});
              },
            ),
          ),
          const SizedBox(
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
                      List medicines = snapshot.data ?? [];
                      return ListView(
                        children: [
                          if (medicines.isNotEmpty)
                            for (Medicine medicine in medicines)
                              Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Image.network(
                                      "https://previews.123rf.com/images/ylivdesign/ylivdesign1612/ylivdesign161200051/67085065-icono-de-vitaminas-o-medicamentos-para-animales-ilustraci%C3%B3n-de-dibujos-animados-de-vitaminas-o-medic.jpg?fj=1",
                                      height: 100,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Código: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + medicine.code),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Nombre: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + medicine.name),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Precio:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + medicine.precio.toString()),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Fecha de vencimiento: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + medicine.fechaVen),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: const [
                                        Text("  Descripción: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("  " + medicine.descripcion),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                          if (medicines.isEmpty)
                            Column(
                              children: const [Text("No hay información")],
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
}
