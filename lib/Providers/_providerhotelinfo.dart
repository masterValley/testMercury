import 'package:flutter/material.dart';
import 'package:mercury_app/Models/hoteldata.dart';

class HotelInfoProvider with ChangeNotifier {
  late String hotelId;
  late HotelInfo hotelInfo;
  setValues(String idHotel) async {
    hotelId = idHotel;
    notifyListeners();
  }

  setHotel(HotelInfo hInfo) {
    hotelInfo = hInfo;
    notifyListeners();
  }

  HotelInfo get getHotel {
    return hotelInfo;
  }

  String get getIDHotel {
    return hotelId;
  }
}
