import 'package:flutter/material.dart';
import 'package:mercury_app/Models/dataContainer.dart';

class HotelProvider with ChangeNotifier {
late ContainerData container;

  late int startTS, endTS;
  void setValues(String destino, DateTime start, DateTime end) {
    start = start;
    end = end;
    destino = destino;
    startTS = start.millisecondsSinceEpoch;
    endTS = start.millisecondsSinceEpoch;
    container = ContainerData(destino, startTS, endTS);
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

}
