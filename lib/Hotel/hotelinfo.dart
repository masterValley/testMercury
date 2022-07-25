import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury_app/GoogleMaps/_mapahotel.dart';
import 'package:mercury_app/Habitaciones/listrooms.dart';
import 'package:mercury_app/Models/hoteldata.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:mercury_app/apis/_hotelapi.dart';
import 'package:provider/provider.dart';

class HotelInfoView extends StatefulWidget {
  const HotelInfoView({Key? key}) : super(key: key);

  @override
  State<HotelInfoView> createState() => _HotelInfoViewState();
}

class _HotelInfoViewState extends State<HotelInfoView> {
  late final Future<HotelInfo> hotelInfo;
  HotelApiInfo hotelApi = HotelApiInfo();
  late final hotelInfoProvider;

  @override
  void initState() {
    super.initState();
    hotelInfoProvider = Provider.of<HotelInfoProvider>(context, listen: false);
    debugPrint('Id de hotel ${hotelInfoProvider.getIDHotel}');
    hotelInfo = hotelApi.getHotelInfo(hotelInfoProvider.getIDHotel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<HotelInfo>(
            future: hotelInfo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                HotelInfo hInfo = snapshot.data as HotelInfo;
                Provider.of<HotelInfoProvider>(context, listen: false)
                    .setHotel(hInfo);
                return Scaffold(
                    backgroundColor: const Color(0xff191c25),
                    extendBodyBehindAppBar: true,
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor:
                          const Color(0xff191c25).withOpacity(0.25),
                      foregroundColor: const Color(0xfff2f2f2),
                    ),
                    body: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        hotelInfoProvider.getHotel.imagen),
                                    fit: BoxFit.cover),
                                color: const Color(0xfff2f2f2)),
                            height: 300,
                            child: Column(children: [
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 32),
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xfff2f2f2),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0)),
                                ),
                                child: Center(
                                  child: ListTile(
                                    title: Text(
                                      hotelInfoProvider.getHotel.nombre,
                                      style: GoogleFonts.leagueGothic(
                                          fontSize: 45,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff191c25)),
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HotelLocation()));
                                        },
                                        icon: const Icon(
                                            Icons.location_on_outlined,
                                            color: Color(0xff191c25),
                                            size: 40)),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 300),
                          color: const Color(0xfff2f2f2),
                          child: ListView(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                child: ListTile(
                                  title: Text(
                                    hotelInfoProvider.getHotel.descripcion,
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: const Color(0xff191c25)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8),
                                child: ListTile(
                                  title: Text(
                                    'FACILIDADES',
                                    style: GoogleFonts.leagueGothic(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xffE9BD44)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 8, bottom: 8, left: 32, right: 8),
                                child: ListTile(
                                  title: Text(
                                    hotelInfoProvider.getHotel.facilidades
                                        .join("\n"),
                                    style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: const Color(0xff191c25)),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xffe9bd44)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          // Change your radius here
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RoomList()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 16, bottom: 16),
                                      child: Text(
                                        "Ver habitaciones",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: const Color(0xff191c25)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ));
              }
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return const Text('error');
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
