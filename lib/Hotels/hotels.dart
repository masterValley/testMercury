import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury_app/Hotels/hotelsList.dart';
import 'package:mercury_app/Models/hotel.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:mercury_app/apis/_hotelesapi.dart';
import 'package:provider/provider.dart';

class HotelsList extends StatefulWidget {
  const HotelsList({Key? key}) : super(key: key);

  @override
  State<HotelsList> createState() => _HotelsListState();
}

class _HotelsListState extends State<HotelsList> {
  late Future<List<Hotel>> hoteles;
  HotelesApi hotelsApi = HotelesApi();
  late final hotelProvider;
  @override
  void initState() {
    super.initState();
    hotelProvider = Provider.of<HotelProvider>(context, listen: false);
    debugPrint(
        'Llamada al provider destino : ${hotelProvider.container.destino}');
    hoteles = hotelsApi.getHotelCity(hotelProvider.container.destino);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Destino: ',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xfff2f2f2)),
              ),
              Text(
                hotelProvider.container.destino,
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xfff2f2f2)),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: const Color(0xff191C25),
          foregroundColor: const Color(0xfff2f2f2),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xff191c25),
          ),
          child: FutureBuilder<List<Hotel>>(
            future: hoteles,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Hotel> hotels = snapshot.data as List<Hotel>;
                return HotelList(hoteles: hotels);
              }
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return const Text('error');
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
