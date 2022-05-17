import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:histovet/src/pages/Home/home_page.dart';
import 'package:histovet/src/pages/clinicalHistory/add_cinicalHistory.dart';
import 'package:histovet/src/pages/clinicalHistory/clinicalHistory_page.dart';
import 'package:histovet/src/pages/medicine/add_medicine.dart';
import 'package:histovet/src/pages/pet/add_pets.dart';
import 'package:histovet/src/pages/medicine/consultar_medicamento.dart';
import 'package:histovet/src/pages/medicine/medicine_page.dart';
import 'package:histovet/src/pages/pet/pet_update.dart';
import 'package:histovet/src/pages/pet/pets_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HistoVet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'HistoVet'),
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        '/home': (context) => Home(),
        PetsPage.id: (context) => PetsPage(),
        '/pets': (context) => PetsPage(),
        AddPet.id: (context) => AddPet(),
        UpdatePet.id: (context) => UpdatePet(""),
        ConsultarMedicamento.id: (context) => ConsultarMedicamento(),
        '/updatepet': (context) => UpdatePet(""),
        MedicinePage.id: (context) => MedicinePage(),
        '/medicine': (context) => MedicinePage(),
        addMedicine.id: (context) => addMedicine(),
        clinicalHistory.id: (context) => clinicalHistory(),
        '/clinicalHistories': (context) => clinicalHistory(),
        AddClinicalHistory.id: (context) => AddClinicalHistory(),
        '/addHistory': (context) => AddClinicalHistory(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp();
          }
          return SizedBox();
        });
  }
}
