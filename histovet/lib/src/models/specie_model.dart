import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

List<SpecieModel> speciesFromJson(dynamic str) =>
    List<SpecieModel>.from((str).map((x) => SpecieModel.fromJson(x)));

class SpecieModel {
  late String? id;
  late String? code;
  late String? name;

  SpecieModel({this.id, this.code, this.name});

  SpecieModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    code = json["code"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data["_id"] = id;
    _data["code"] = code;
    _data["name"] = name;

    return _data;
  }
}
