import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
// import 'package:intl/intl.dart';

// DateTime now = DateTime.now();
// String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

class ClinicalHistory {
  final String? id;
  final int numberCH;
  final String date;
  final String time;
  final String docOwner;
  final String nameOwner;
  final String contactOwner;
  final String addressOwner;
  final String phoneNumberOwner;
  final String emailAddressOwner;
  final String name;
  final String specie;
  final String breed;
  final String sex;
  final String color;
  final int weight;
  final String origin;
  final String diet;
  final String previousIllnesses;
  final String previousSurgeries;
  final String sterilized;
  final int nAnimalBirths;
  final String vaccinationSchedule;
  final String lastDeworming;
  final String recentTreatments;
  final String animalBehavior;
  final String reasonForConsultation;
  final String physicalCondition;
  final double temperature;
  final double heartFrequency;
  final double respiratoryFrequency;
  final double tllc;
  final double pulse;
  final double trcp;
  final double percentageDehydration;
  final double mucous;

  ClinicalHistory(
      this.id,
      this.numberCH,
      this.date,
      this.time,
      this.docOwner,
      this.nameOwner,
      this.contactOwner,
      this.addressOwner,
      this.phoneNumberOwner,
      this.emailAddressOwner,
      this.name,
      this.specie,
      this.breed,
      this.sex,
      this.color,
      this.weight,
      this.origin,
      this.diet,
      this.previousSurgeries,
      this.previousIllnesses,
      this.sterilized,
      this.nAnimalBirths,
      this.vaccinationSchedule,
      this.lastDeworming,
      this.recentTreatments,
      this.animalBehavior,
      this.reasonForConsultation,
      this.physicalCondition,
      this.temperature,
      this.heartFrequency,
      this.respiratoryFrequency,
      this.tllc,
      this.pulse,
      this.trcp,
      this.percentageDehydration,
      this.mucous);
}
