import 'package:flutter/material.dart';
import 'package:mercury_app/Models/habitacion.dart';
import 'package:mercury_app/Providers/_providerhabitacion.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:mercury_app/Room/habitaciondisponible.dart';
import 'package:mercury_app/Room/habitacionnodisponible.dart';
import 'package:mercury_app/apis/_habitaciondisponibleapi.dart';
import 'package:provider/provider.dart';

class RoomInfo extends StatefulWidget {
  const RoomInfo({Key? key}) : super(key: key);

  @override
  State<RoomInfo> createState() => _RoomInfoState();
}

class _RoomInfoState extends State<RoomInfo> {
  late final hotelProvider, fechasProvider, roomProvider;
  late final Future<bool> disponibilidad;
  final HabitacionApi hInfo = HabitacionApi();
  @override
  void initState() {
    super.initState();
    hotelProvider = Provider.of<HotelInfoProvider>(context, listen: false);
    fechasProvider = Provider.of<HotelProvider>(context, listen: false);
    roomProvider = Provider.of<RoomProvider>(context, listen: false);
    debugPrint(roomProvider.getRoom.id);
    disponibilidad = hInfo.verifyRoom(
        hotelProvider.getIDHotel,
        roomProvider.getRoom.id,
        fechasProvider.getstart.toString(),
        fechasProvider.getend.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<bool>(
            future: disponibilidad,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                bool disponible = snapshot.data as bool;
                if (disponible == true) {
                  return AvailableRoom(habitacion: roomProvider.getRoom);
                } else {
                  return UnavailableRoom(habitacion: roomProvider.getRoom);
                }
              }
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return const Text('error');
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
