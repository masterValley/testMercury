import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury_app/Models/habitacion.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:mercury_app/User/userView.dart';
import 'package:provider/provider.dart';

class AvailableRoom extends StatefulWidget {
  final Habitacion habitacion;
  const AvailableRoom({Key? key, required this.habitacion}) : super(key: key);

  @override
  State<AvailableRoom> createState() => _AvailableRoomState();
}

class _AvailableRoomState extends State<AvailableRoom> {
  late final reservaProvider;
  num valor = 0;

  @override
  void initState() {
    super.initState();
    reservaProvider = Provider.of<HotelProvider>(context, listen: false);
    setState(() {
      valor = widget.habitacion.precio * reservaProvider.getdays;
    });
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
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(2),
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  widget.habitacion.nombre,
                  style: GoogleFonts.leagueGothic(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff191c25)),
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
            ),
            ListTile(
              title: Text(
                'PRECIO:',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff191c25)),
              ),
            ),
            ListTile(
              title: Text(
                '$valor USD POR ${reservaProvider.getdays} DÍA(S)',
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClienteView(valor: valor),
                        ));
                  },
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
        ),
      ),
    );
  }
}
