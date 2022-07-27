import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:mercury_app/Models/reserva.dart';
import 'package:mercury_app/Providers/_providereserva.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';

class ReservasApi {
  Future<Reserva> createReserva(String hotelId, String roomId, Map body) async {
    final response = await http.post(
        Uri.parse(
            "https://us-central1-fb-api-d1076.cloudfunctions.net/reservas/generateReservation/$hotelId/$roomId"),
        body: body);
    return Reserva.fromJson(json.decode(response.body));
  }

  Future<Reserva> postData(
      String hotelId, String roomId, ProviderReserva reserva, HotelProvider hotelProvider) async {
        Timestamp tEntrada = Timestamp.fromMillisecondsSinceEpoch(reserva.getReserva.fechaEntrada); 
        Timestamp tSalida = Timestamp.fromMillisecondsSinceEpoch(reserva.getReserva.fechaSalida); 
    final http.Response response = await http.post(
        Uri.parse(
            "https://us-central1-fb-api-d1076.cloudfunctions.net/reservas/generateReservation/$hotelId/$roomId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "camas": reserva.getReserva.numeroCamas,
          "id": reserva.getReserva.codigoReserva,
          "capacidad": reserva.getReserva.capacidad,
          "codigoReserva": reserva.getReserva.codigoReserva,
          "correoCliente": reserva.getReserva.correoCliente,
          "diasReserva": reserva.getReserva.diasReserva,
          "estado": "asd",
          "fechaEntrada": 111454 ,//reserva.getReserva.fechaEntrada.toString(), 
          "fechaSalida": 21654, //reserva.getReserva.fechaSalida.toString(),
          "nombreCliente": reserva.getReserva.nombreCliente,
          "nombreHabitacion": reserva.getReserva.nombre,
          "nombreHotel": reserva.getReserva.nombreHotel,
          "numeroHabitacion": reserva.getReserva.numeroHabitacion,
          "precio": reserva.getReserva.precio,
          "tamañoHabitacion": reserva.getReserva.tamao
        }));
    if (response.statusCode == 204) {
      print(response.body);
      return Reserva.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create.');
    }
  }
}
