import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/sale_model.dart';

class SaleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final databaseRef = FirebaseDatabase.instance.ref();

  Sale sale = Sale("", "", "", "", 0.0, 0.0);

  CollectionReference medicineAll =
      FirebaseFirestore.instance.collection("medicine");

  Future<bool> addSale(Sale sale) async {
    final DocumentReference saleDoc = _firestore.collection("sale").doc();

    try {
      await saleDoc.set({
        "id": saleDoc.id,
        "code": sale.code,
        "name": sale.name,
        "lote": sale.lote,
        "precio": sale.precio,
        "cantidad": sale.cantidad,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Sale>> getSales() async {
    List<Sale> sales = [];
    try {
      final collection = FirebaseFirestore.instance.collection('sale');
      collection.snapshots().listen((querySnapshot) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data();
          Sale newSale = Sale(data["id"], data["code"], data["name"],
              data["lote"], data["precio"], data["cantidad"]);
          sales.add(newSale);
        }
      });
      return sales;
    } catch (e) {
      return sales;
    }
  }
}
