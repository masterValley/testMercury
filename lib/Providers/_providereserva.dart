import 'package:flutter/cupertino.dart';
import 'package:mercury_app/Models/habitacion.dart';
import 'package:mercury_app/Models/hotel.dart';
import 'package:mercury_app/Models/user.dart';

import '../Models/reserva.dart';

class ProviderReserva with ChangeNotifier {
  late Habitacion habitacion;
  late User user;
  late Hotel hotel;
  late Container container;
  late Reserva reserva;

  void setReserva (Reserva reservaFinal) {
    reserva = reservaFinal;
    notifyListeners();
  }

  Habitacion get getHabitacionReserva {
    return habitacion;
  }

  User get getUserReserva {
    return user;
  }

  Reserva get getReservaFinal {
    print(reserva);
    return reserva;
  }

  int? get getDaysFormatLlegada {
    return reserva.fechaEntrada;
  }

  int? get getDaysFormatSalida {
    return reserva.fechaSalida;
  }

  String? get getIdReserva {
    return reserva.codigoReserva;
  }
}