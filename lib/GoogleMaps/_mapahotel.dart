import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:provider/provider.dart';

class HotelLocation extends StatefulWidget {
  const HotelLocation({Key? key}) : super(key: key);

  @override
  State<HotelLocation> createState() => _HotelLocationState();
}

class _HotelLocationState extends State<HotelLocation> {
  late final hotelInfoProvider;
  late GoogleMapController gController;
  late CameraPosition positionHotel;
  Set<Marker> markers = {};
  @override
  void initState() {
    super.initState();
    markers = {};
    hotelInfoProvider = Provider.of<HotelInfoProvider>(context, listen: false);
    positionHotel = CameraPosition(
        target: LatLng(hotelInfoProvider.getHotel.coordenadas.logitud,
            hotelInfoProvider.getHotel.coordenadas.latitud),
        zoom: 18.0);
    markers.add(Marker(
        markerId: MarkerId(hotelInfoProvider.getHotel.nombre.toString()),
        position: LatLng(hotelInfoProvider.getHotel.coordenadas.logitud,
            hotelInfoProvider.getHotel.coordenadas.latitud)));
    debugPrint('${hotelInfoProvider.getHotel.coordenadas.latitud}');
  }

  @override
  Widget build(BuildContext context) {
    //Text('${hotelInfoProvider.getHotel.coordenadas.latitud} y ${hotelInfoProvider.getHotel.coordenadas.logitud} y ${hotelInfoProvider.getHotel.calles}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff191c25), //change your color here
        ),
        titleSpacing: 2.0,
        centerTitle: true,
        title: Text(
          hotelInfoProvider.getHotel.nombre.toString(),
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: const Color(0xff191c25)),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff191c25).withOpacity(0.25),
        foregroundColor: const Color(0xfff2f2f2),
      ),
      body: GoogleMap(
        initialCameraPosition: positionHotel,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController:
          controller;
        },
      ),
    );
  }
}
