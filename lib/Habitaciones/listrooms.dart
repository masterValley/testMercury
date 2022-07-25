import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury_app/Habitaciones/listahabitaciones.dart';
import 'package:mercury_app/Models/habitacion.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:mercury_app/apis/_habitacionesapi.dart';
import 'package:provider/provider.dart';

class RoomList extends StatefulWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  State<RoomList> createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  late final hotelProvider, fechasProvider;
  late Future<List<Habitacion>> habitaciones;
  HabitacionesApi hApi = HabitacionesApi();
  @override
  void initState() {
    super.initState();
    hotelProvider = Provider.of<HotelInfoProvider>(context, listen: false);
    fechasProvider = Provider.of<HotelProvider>(context, listen: false);
    habitaciones = hApi.getHgetHRooms(hotelProvider.getIDHotel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            hotelProvider.getHotel.nombre,
            style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: const Color(0xfff2f2f2)),
          ),
          
          elevation: 0,
          backgroundColor: const Color(0xff191C25),
          foregroundColor: const Color(0xfff2f2f2),
        ),
      body: Container(
          decoration: const BoxDecoration(
            color: Color(0xfff2f2f2),
          ),
          child: FutureBuilder<List<Habitacion>>(
              future: habitaciones,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Habitacion> habitacionesList =
                      snapshot.data as List<Habitacion>;
                  return RoomsList(habitaciones: habitacionesList);
                }
                if (snapshot.hasError) {
                  debugPrint(snapshot.error.toString());
                  return const Text('error');
                }
                return const Center(child: CircularProgressIndicator());
              })),
    );
  }
}
