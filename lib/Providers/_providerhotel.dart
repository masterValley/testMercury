import 'package:flutter/material.dart';
import 'package:mercury_app/Models/dataContainer.dart';

class HotelProvider with ChangeNotifier {
  late ContainerData container;

  late int startTS, endTS, startAux, endAux;
  void setValues(String destino, DateTime start, DateTime end) {
    start = start;
    end = end;
    destino = destino;
    startTS = start.millisecondsSinceEpoch;
    endTS = end.millisecondsSinceEpoch;
    startAux = (startTS/1000).round();
    endAux = (endTS/1000).round()+43200;
    int dayBetween = end.difference(start).inDays;
    container = ContainerData(destino, startAux, endAux, dayBetween);
    debugPrint('Diferencia de días: ${container.dayBetween}');
    debugPrint('llegada: ${container.start}');
    debugPrint('salida: ${container.end}');
    notifyListeners();
  }

  String get getDestino {
    return container.destino;
  }

  int get getstart {
    return container.start;
  }

  int get getend {
    return container.end;
  }

  int get getdays {
    return container.dayBetween;
  }
}
