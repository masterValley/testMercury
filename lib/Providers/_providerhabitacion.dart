import 'package:flutter/material.dart';
import 'package:mercury_app/Models/habitacion.dart';

class RoomProvider extends ChangeNotifier {
  late Habitacion habitacion;
  late bool disponibilidad;

  void setdisponibilidad(bool disponibilidad) {
    disponibilidad = disponibilidad;
    notifyListeners();
  }

  void setRoom(Habitacion room) {
    habitacion = room;
    notifyListeners();
  }

  Habitacion get getRoom {
    return habitacion;
  }

  bool get getDisponibilidad {
    return disponibilidad;
  }
}
