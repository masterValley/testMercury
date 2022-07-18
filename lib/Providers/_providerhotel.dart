import 'package:flutter/material.dart';
import 'package:mercury_app/Models/hotel.dart';

class HotelProvider with ChangeNotifier {
  late Hotel hotel;
  late String destino;
  late DateTime start, end;

  late int startTS, endTS;
  void setValues(String destino, DateTime start, DateTime end) {
    start = start;
    end = end;
    destino = destino;
    hotel = Hotel(destino, start, end);
    startTS = start.millisecondsSinceEpoch;
    endTS = start.millisecondsSinceEpoch;
    notifyListeners();
  }

  Hotel get getHotels {
    return hotel;
  }

  int get getstart {
    return startTS;
  }

  
  int get getend {
    return endTS;
  }
}
