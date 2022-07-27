import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mercury_app/Models/reserva.dart';
import 'package:mercury_app/Providers/_providereserva.dart';
import 'package:mercury_app/Providers/_providerhabitacion.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:mercury_app/Providers/_provideruser.dart';

class ReservasApi {
<<<<<<< HEAD
  static Future createReserva(String hotelId, String roomId, Map body) async {
    return http
        .post(
            Uri.parse(
                "https://us-central1-fb-api-d1076.cloudfunctions.net/reservas/generateReservation/$hotelId/$roomId"),
            body: body)
        .then((http.Response response) {
      return Reserva.fromJson(json.decode(response.body));
    });
=======
  Future<Reserva> createReserva(String hotelId, String roomId, Map body) async {
    final response = await http.post(
      Uri.parse(
          "https://us-central1-fb-api-d1076.cloudfunctions.net/reservas/generateReservation/$hotelId/$roomId"),

      body: body
    );
    return Reserva.fromJson(json.decode(response.body));
>>>>>>> 0e7439ea5c20f01ed32895ad28099ce60721e71f
  }
}
