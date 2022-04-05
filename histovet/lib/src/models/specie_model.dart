import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Specie {
  final String? id;
  final String code;
  final String name;

  Specie(this.id, this.code, this.name);
}
