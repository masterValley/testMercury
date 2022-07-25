import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mercury_app/Models/habitacion.dart';

class HabitacionApi {
  Future<bool> verifyRoom(String query, query2, query3, query4) async {
    bool disponible;
    debugPrint("Llamada a la api con destino: $query");
    var response = await http.get(Uri.parse(
        'https://us-central1-fb-api-d1076.cloudfunctions.net/reservas/checkRoom/$query/$query2/$query3/$query4'));
    debugPrint(response.body);
    var jsonData = json.decode(response.body);
    disponible = jsonData['result'];
    return disponible;
  }
}
