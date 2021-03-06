import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury_app/Models/habitacion.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:provider/provider.dart';

class AvailableRoom extends StatefulWidget {
  final Habitacion habitacion;
  const AvailableRoom({Key? key, required this.habitacion}) : super(key: key);

  @override
  State<AvailableRoom> createState() => _AvailableRoomState();
}

class _AvailableRoomState extends State<AvailableRoom> {
  late final reservaProvider;

  @override
  void initState() {
    super.initState();
    reservaProvider = Provider.of<HotelProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
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
                ),
                ListTile(
                  title: Text(
                    'PRECIO:',
                    style: GoogleFonts.leagueGothic(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffE9BD44)),
                  ),
                ),
                ListTile(
                  title: Text(
                    '${widget.habitacion.precio * reservaProvider.getdays} USD POR ${reservaProvider.getdays} DÍA(S)',
                    style: GoogleFonts.leagueGothic(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff191c25)),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffe9bd44)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Container(
                        margin: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          "Seleccionar habitación",
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
            ))
      ]),
    );
  }
}
