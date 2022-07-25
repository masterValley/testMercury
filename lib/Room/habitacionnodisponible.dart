import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury_app/Models/habitacion.dart';

class UnavailableRoom extends StatefulWidget {
  final Habitacion habitacion;
  const UnavailableRoom({Key? key, required this.habitacion}) : super(key: key);

  @override
  State<UnavailableRoom> createState() => _UnavailableRoomState();
}

class _UnavailableRoomState extends State<UnavailableRoom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        title: Text(
          'Habitación no disponible',
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: const Color(0xff191c25)),
        ),
        elevation: 0,
        backgroundColor: const Color(0xfff2f2f2),
        foregroundColor: const Color(0xff191c25),
      ),
      body: Stack(children: [
        Container(
            margin: const EdgeInsets.all(16),
            color: const Color(0xfff2f2f2),
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    widget.habitacion.nombre,
                    style: GoogleFonts.leagueGothic(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff191c25)),
                  ),
                ),
                ListTile(
                  title: Text(
                    'NÚMERO DE HABITACIÓN: ',
                    style: GoogleFonts.leagueGothic(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffE9BD44)),
                  ),
                ),
                ListTile(
                  title: Text(
                    widget.habitacion.numeroHabitacion,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff191c25)),
                  ),
                ),
                ListTile(
                  title: Text(
                    'CAPACIDAD: ',
                    style: GoogleFonts.leagueGothic(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffE9BD44)),
                  ),
                ),
                ListTile(
                  title: Text(
                    '${widget.habitacion.capacidad} persona(s)',
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff191c25)),
                  ),
                ),
                ListTile(
                  title: Text(
                    'CAMAS: ',
                    style: GoogleFonts.leagueGothic(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffE9BD44)),
                  ),
                ),
                ListTile(
                  title: Text(
                    '${widget.habitacion.numeroCamas} cama(s) tipo: ${widget.habitacion.tipoCamas}',
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff191c25)),
                  ),
                ),
                ListTile(
                  title: Text(
                    'EN EL BAÑO:',
                    style: GoogleFonts.leagueGothic(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffE9BD44)),
                  ),
                ),
                ListTile(
                  title: Text(
                    widget.habitacion.itemsBao.join("\n"),
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff191c25)),
                  ),
                ),
                ListTile(
                  title: Text(
                    'EN LA HABITACIÓN:',
                    style: GoogleFonts.leagueGothic(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffE9BD44)),
                  ),
                ),
                ListTile(
                  title: Text(
                    widget.habitacion.itemsHabitacion.join("\n"),
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff191c25)),
                  ),
                ),
                ListTile(
                  title: Text(
                    'POLÍTICA DE HUMO:',
                    style: GoogleFonts.leagueGothic(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffE9BD44)),
                  ),
                ),
                ListTile(
                  title: Text(
                    widget.habitacion.politicaHumo,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff191c25)),
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
