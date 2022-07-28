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
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(2),
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
              Container(
                margin: const EdgeInsets.all(8),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'NÚMERO DE HABITACIÓN:  ',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff191c25)),
                      ),
                      Text(
                        widget.habitacion.numeroHabitacion,
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff191c25)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'CAPACIDAD:  ',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff191c25)),
                      ),
                      Text(
                        '${widget.habitacion.capacidad} persona(s)',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff191c25)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        'CAMAS: ',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff191c25)),
                      ),
                      Text(
                        '${widget.habitacion.numeroCamas} cama(s) tipo: ${widget.habitacion.tipoCamas}',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff191c25)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        'TAMAÑO: ',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff191c25)),
                      ),
                      Text(
                        '${widget.habitacion.tamao} metros cuadradros',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff191c25)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8, left: 8),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'EN EL BAÑO:',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff191c25)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                widget.habitacion.itemsBao.join("\n"),
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff191c25)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'EN LA HABITACIÓN:',
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff191c25)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                widget.habitacion.itemsHabitacion.join("\n"),
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xff191c25)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'POLÍTICA DE HUMO:',
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff191c25)),
                ),
              ),
              ListTile(
                title: Text(
                  widget.habitacion.politicaHumo,
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff191c25)),
                ),
              )
            ],
          ),
      ),
    );
  }
}
