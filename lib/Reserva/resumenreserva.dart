import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mercury_app/Providers/_providereserva.dart';
import 'package:mercury_app/Providers/_providerhabitacion.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:mercury_app/Providers/_provideruser.dart';
import 'package:mercury_app/Reserva/pantallafinal.dart';
import 'package:provider/provider.dart';

class ResumenReserva extends StatefulWidget {
  num valor;
  ResumenReserva({required this.valor ,Key? key}) : super(key: key);

  @override
  State<ResumenReserva> createState() => _ResumenReservaState();
}

class _ResumenReservaState extends State<ResumenReserva> {
  late final reservaGuardadaProvider;
  late final userGuardadoProvider;
  late final hotelGuardarProvider;
  late final reservaRegistrada;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reservaGuardadaProvider = Provider.of<RoomProvider>(context, listen: false);
    userGuardadoProvider = Provider.of<UserProvider>(context, listen: false);
    hotelGuardarProvider = Provider.of<HotelInfoProvider>(context, listen: false);
    reservaRegistrada = Provider.of<ProviderReserva>(context, listen: false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#191C25"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
            child: Text(
              '${reservaGuardadaProvider.getRoom.nombre}',
              textAlign: TextAlign.center,
              style: GoogleFonts.leagueGothic(
                  color: HexColor('E9BD44'),
                  fontWeight: FontWeight.normal,
                  fontSize: 40.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                child: Text(
                  'HOTEL :',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE9BD44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 50.0, 0.0, 0.0),
                child: Text(
                  '${hotelGuardarProvider.getHotel.nombre}',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#FFFFFF")),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                child: Text(
                  'CÓDIGO DE RESERVA :',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE9BD44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child: Text(
                  '${reservaRegistrada.getReservaFinal.codigoReserva}',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#FFFFFF")),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                child: Text(
                  'NÚMERO DE HABITACIÓN :',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE9BD44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child: Text(
                  '${reservaGuardadaProvider.getRoom.numeroHabitacion}',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#FFFFFF")),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                child: Text(
                  'RESERVA A NOMBRE DE :',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE9BD44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child: Text(
                  '${userGuardadoProvider.getUser.names} ${userGuardadoProvider.getUser.lastNames}',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#FFFFFF")),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                child: Text(
                  'CORREO ELECTRÓNICO :',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE9BD44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child: Text(
                  '${userGuardadoProvider.getUser.email}',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#FFFFFF")),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                child: Text(
                  'CAMAS :',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE9BD44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child: Text(
                  '${reservaGuardadaProvider.getRoom.numeroCamas} cama(s)',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#FFFFFF")),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                child: Text(
                  'CAPACIDAD :',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE9BD44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child: Text(
                  '${reservaGuardadaProvider.getRoom.capacidad} persona(s)',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#FFFFFF")),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                child: Text(
                  'TAMAÑO DE LA HABITACIÓN :',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE9BD44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                child: Text(
                  '${reservaGuardadaProvider.getRoom.tamao} m2',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#FFFFFF")),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
                child: Text(
                  'TOTAL CANCELADO :',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffE9BD44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 0.0),
                child: Text(
                  '\$${widget.valor.toString()} (\$'+ reservaGuardadaProvider.getRoom.precio.toString() +' por noche)',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#FFFFFF")),
                ),
              ),
              Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 16),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xffe9bd44)),
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
                        builder: (context) => FinalPage(valor: widget.valor,)
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    "Guardar reserva",
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
        ],
      ),
    );
  }
}
