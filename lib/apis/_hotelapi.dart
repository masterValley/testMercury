import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mercury_app/Models/hoteldata.dart';

class HotelApiInfo {
  Future<HotelInfo> getHotelInfo(String query) async {
    HotelInfo hotelInfo;
    debugPrint("Llamada a la api con destino: $query");
    var response = await http.get(Uri.parse(
        'https://us-central1-fb-api-d1076.cloudfunctions.net/hoteles/getHotelById/$query'));
    var jsonData = json.decode(response.body);
    hotelInfo = HotelInfo.fromJson(jsonData);
    debugPrint(hotelInfo.nombre);
    return hotelInfo;
  }
}
