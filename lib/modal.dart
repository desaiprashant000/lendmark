// ignore_for_file: library_prefixes

import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

import 'lendmark.dart';

class Modeldata {
  // Future<List<landmark>> FavoriteLandMarks() async {
  //   List<landmark> jasonDate = await Modeldata().LandMarks();
  //
  //   return jasonDate.where((element) => element.isFeatured == true).toList();
  // }
  //
  // Future<List<landmark>> LakesLandMarks() async {
  //   List<landmark> jasonDate = await Modeldata().LandMarks();
  //
  //   return jasonDate.where((element) => element.category == 'Lakes').toList();
  // }
  //
  // Future<List<landmark>> RiversLandMarks() async {
  //   List<landmark> jasonDate = await Modeldata().LandMarks();
  //
  //   return jasonDate.where((element) => element.category == 'Rivers').toList();
  // }
  //
  // Future<List<landmark>> MountainsLandMarks() async {
  //   List<landmark> jasonDate = await Modeldata().LandMarks();
  //
  //   return jasonDate
  //       .where((element) => element.category == 'Mountains')
  //       .toList();
  // }
  //
  // Future<List<landmark>> LandMarks() async {
  //
  //   final lanmarks =
  //       await rootBundle.rootBundle.loadString('jsondata/landmarkData.json');
  //   final jasonDate = json.decode(lanmarks.toString()) as List<dynamic>;
  //   return jasonDate.map((e) => landmark.fromJson(e)).toList();
  // }

  static final Modeldata _sharedInstance = Modeldata._internal();
  Future<List<landmark>>? landmarks;
 // List<landmark>


  factory Modeldata() {
    // print(" Modeldata Initializing....");

    return _sharedInstance;
  }

  Modeldata._internal() {
    landmarks = Modeldata.loadLandmarks('jsondata/landmarkData.json');
  }

  static Future<List<landmark>> featuredLandmarks() async {
    // print('favoritLandmarks');
    List<landmark> landmarks =
        await Modeldata._sharedInstance.landmarks as List<landmark>;
    return landmarks.where((element) => element.isFeatured == true).toList();
  }

  static Future<List<landmark>> allLandmarks() async {
    // print('allLandmarks');
    List<landmark> landmarks =
    await Modeldata._sharedInstance.landmarks as List<landmark>;
    return landmarks;
  }
  static Future<List<landmark>>? loadLandmarks(String fileName) async {
    // print("loadLandmarks is in process...");
    final jsondata =
        await rootBundle.rootBundle.loadString("jsondata/landmarkData.json");

    final list = json.decode(jsondata.toString()) as List<dynamic>;

    List<landmark> landmarks = list.map((e) => landmark.fromJson(e)).toList();

    return landmarks;
  }
}

