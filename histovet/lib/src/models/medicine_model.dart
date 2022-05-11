import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Medicine {
  final String? id;
  final String code;
  final String name;
  final String descripcion;
  final String grupo;
  final double precio;
  final String fechaVen;

  Medicine(this.id, this.code, this.name, this.descripcion, this.grupo, this.precio, this.fechaVen);
}
