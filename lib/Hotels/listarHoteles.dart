import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury_app/Hotel/hotelinfo.dart';
import 'package:mercury_app/Models/hotel.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:provider/provider.dart';

class HotelItem extends StatelessWidget {
  const HotelItem({Key? key, required this.hotel}) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(hotel.imagen), fit: BoxFit.cover),
          color: const Color(0xfff2f2f2),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)
          ]),
      height: 375,
      margin: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 16,
      ),
      child: Column(children: [
        Expanded(
          child: Container(),
        ),
        Container(
          height: 123,
          decoration: const BoxDecoration(
            color: Color(0xff191c25),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
          ),
          child: Center(
            child: ListTile(
              title: Text(
                hotel.nombre,
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xfff2f2f2)),
              ),
              subtitle: Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  hotel.calles,
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: const Color(0xfff2f2f2)),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Provider.of<HotelInfoProvider>(context, listen: false)
                        .setValues(hotel.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HotelInfoView()));
                  },
                  icon: const Icon(Icons.arrow_right, color: Color(0xfff2f2f2), size: 40)),
            ),
          ),
        )
      ]),
    );
  }
}
