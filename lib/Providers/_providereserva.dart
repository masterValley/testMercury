import 'package:flutter/cupertino.dart';
import 'package:mercury_app/Models/dataContainer.dart';
import 'package:mercury_app/Models/habitacion.dart';
import 'package:mercury_app/Models/hotel.dart';
import 'package:mercury_app/Models/user.dart';

import '../Models/reserva.dart';

class ProviderReserva with ChangeNotifier {
  late User user;
  late Reserva reserva;
  late String idReserva;

  void setReserva(Reserva reservaFinal) {
    reserva = reservaFinal;
    notifyListeners();
  }

  void setIdReserva(Reserva reserva) {
    idReserva =
        '${reserva.fechaEntrada}${reserva.fechaSalida}${reserva.numeroHabitacion}';
    notifyListeners();
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


  Reserva get getReserva {
    return reserva;
  }

}
