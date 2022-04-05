import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Breed {
  final String? id;
  final String code;
  final String name;

  Breed(this.id, this.code, this.name);
}
