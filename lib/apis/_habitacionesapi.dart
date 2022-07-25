import 'package:flutter/material.dart';
import 'package:mercury_app/Models/habitacion.dart';

import '../Models/hotel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HabitacionesApi {
  Future<List<Habitacion>> getHgetHRooms(String query) async {
    debugPrint("Llamada a la api con destino: $query");
    var response = await http.get(Uri.parse(
        'https://us-central1-fb-api-d1076.cloudfunctions.net/habitaciones/getAllRoomsIn/$query'));
    var jsonData = json.decode(response.body);

    List<Habitacion> habitaciones = [];

    for (var u in jsonData) {
      Habitacion hotel = Habitacion.fromJson(u);
      habitaciones.add(hotel);
    }

    debugPrint(habitaciones.length.toString());
    return habitaciones;
  }
}
