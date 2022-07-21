import 'package:flutter/material.dart';

import '../Models/hotel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HotelesApi {
  Future<List<Hotel>> getHotelCity(String query) async {
    debugPrint("Llamada a la api con destino: $query");
    var response = await http.get(
        Uri.parse(
            'https://us-central1-fb-api-d1076.cloudfunctions.net/hoteles/getHotelByLocation/$query'),
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*",
        });
    var jsonData = json.decode(response.body);

    List<Hotel> hoteles = [];

    for (var u in jsonData) {
      Hotel hotel = Hotel(
          nombre: u['nombre'],
          calles: u['calles'],
          id: u['id'],
          imagen: u['imagen']);
      hoteles.add(hotel);
    }

    debugPrint(hoteles.length.toString());
    return hoteles;
  }
}
