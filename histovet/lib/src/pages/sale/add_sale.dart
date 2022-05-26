import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:histovet/src/controller/sale_controller.dart';

import '../../models/sale_model.dart';

class AddSale extends StatefulWidget {
  static String id = "form_sale";
  const AddSale({Key? key}) : super(key: key);

  @override
  State<AddSale> createState() => _AddSaleState();
}

class _AddSaleState extends State<AddSale> {
  final _formState = GlobalKey<FormBuilderState>();
  final SaleController saleController = SaleController();
  bool respuesta = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("zona de compra"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          getInfoSale();
        },
      ),
      body: FormBuilder(
          key: _formState,
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 20,
                  right: 40,
                  bottom: 20,
                ),
                //height: 500,
                child: Column(children: <Widget>[
                  Row(
                    children: const [
                      Text(
                        "  Nombre: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("  nombre"),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Text("  Precio:",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("  precio"),
                    ],
                  ),
                ]),
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FormBuilderDropdown(
                      name: "formaPago",
                      decoration: const InputDecoration(
                          labelText: "Pago",
                          prefixIcon: Icon(Icons.article_outlined),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      hint: const Text("Seleccionar forma de pago"),
                      validator: FormBuilderValidators.required(context,
                          errorText: "Seleccione una forma de pago"),
                      items: [
                        {'value': 'Tarjeta', 'key': 'Tarjeta'},
                        {'value': 'Efectivo', 'key': 'Efectivo'}
                      ]
                          .map((formaPago) => DropdownMenuItem(
                              value: formaPago["value"],
                              child: Text("${formaPago["value"]}")))
                          .toList())),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                  name: "tarjeta",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      labelText: "numero",
                      hintText: "Ingrese numero de tarjeta",
                      prefixIcon: Icon(Icons.code),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "Valor requerido"),
                    FormBuilderValidators.integer(context,
                        errorText: "No puede tener decimales"),
                    FormBuilderValidators.min(context, 1,
                        errorText: "Debe ser un número mayor que 0"),
                    FormBuilderValidators.minLength(context, 16,
                        errorText: "La longitud del documento es de 16")
                  ]),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: FormBuilderTextField(
                    name: "cantidad",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Cantidad",
                        hintText: "Ingresa la cantidad",
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "Valor requerido"),
                      FormBuilderValidators.min(context, 0,
                          errorText: "La cantidad debe ser mayor que 0")
                    ])),
              ),
            ],
          )),
    );
  }

  void getInfoSale() async {
    bool validate = _formState.currentState!.saveAndValidate();
    if (validate) {
      final values = _formState.currentState!.value;
      final formaPago = values["formaPago"];
      final cantidad = double.parse(values["cantidad"]);
      final pago = values["pago"];
      final precio = 1000.0; //TODO: obtener precio de la medicina
      final name = "medicina"; //TODO: obtener nombre de la medicina
      final total = precio * cantidad;
      final code = "";

      late Sale sale = Sale("", code, name, formaPago, precio, cantidad, total);
      addSaleMessage(sale);
    }
  }

  void addSaleMessage(Sale sale) async {
    respuesta = await saleController.addSale(sale);
    if (respuesta) {
      Navigator.pushNamed(context, '/medicine').then((_) => setState(() {}));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("compra exitosa..."),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("error en la compra, Intente de nuevo..."),
        backgroundColor: Colors.green,
      ));
    }
  }
}
