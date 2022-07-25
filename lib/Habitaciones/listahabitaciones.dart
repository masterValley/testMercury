import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury_app/Models/habitacion.dart';
import 'package:mercury_app/Providers/_providerhabitacion.dart';
import 'package:mercury_app/Room/room.dart';
import 'package:provider/provider.dart';

class RoomsList extends StatelessWidget {
  final List<Habitacion> habitaciones;
  const RoomsList({Key? key, required this.habitaciones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xfff2f2f2),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(32.0),
          itemCount: habitaciones.length,
          itemBuilder: (context, index) {
            return Room(habitacion: habitaciones[index]);
          }),
    );
  }
}

class Room extends StatelessWidget {
  const Room({
    Key? key,
    required this.habitacion,
  }) : super(key: key);

  final Habitacion habitacion;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
            color: Color(0xff191c25),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        height: 120,
        child: Center(
          child: ListTile(
            title: Text(
              habitacion.nombre,
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xfff2f2f2)),
            ),
            subtitle: Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                '${habitacion.numeroCamas.toString()} camas tipo: ${habitacion.tipoCamas}',
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    color: const Color(0xfff2f2f2)),
              ),
            ),
            trailing: TextButton(
              onPressed: () {
                Provider.of<RoomProvider>(context, listen: false)
                    .setRoom(habitacion);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RoomInfo()));
              },
              child: Column(
                children: [
                  Text(
                    '${habitacion.precio.toString()} USD',
                    style: GoogleFonts.leagueGothic(
                        fontSize: 20, color: const Color(0xffe9bd44)),
                  ),
                  Text(
                    'Por noche',
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: const Color(0xfff2f2f2)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
