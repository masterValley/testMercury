import 'package:flutter/material.dart';
import 'package:mercury_app/Models/hotel.dart';

class HotelProvider with ChangeNotifier {
  late Hotel hotel;
  late String destino;
  late DateTime start, end;

  void setValues(String destino, DateTime start, DateTime end) {
    start = start;
    end = end;
    destino = destino;
    hotel = Hotel(destino, start, end);
    notifyListeners();
  }

  Hotel get getHotels{
    return hotel;
  }
}
