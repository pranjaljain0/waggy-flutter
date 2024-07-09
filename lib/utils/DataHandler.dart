import 'dart:convert';
import 'package:nanoid/nanoid.dart';

class DataHandler {
  static signUpDataInsertion({required uid, required data}) {}

  static getUsersPet({required uid}) async {
    var data;
  }

  static newPetDataInsertion({required data, required uid}) {
    var id = nanoid();
  }

  static updateUserLocation({required geoData, required uid}) {}
}
