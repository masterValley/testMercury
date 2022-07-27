import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mercury_app/Models/reserva.dart';
import 'package:mercury_app/Providers/_providereserva.dart';
import 'package:mercury_app/Providers/_providerhabitacion.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:mercury_app/Providers/_provideruser.dart';
import 'package:mercury_app/Reserva/resumenreserva.dart';
import 'package:mercury_app/apis/_reservasapi.dart';
import 'package:provider/provider.dart';

class SuccesfullPayment extends StatefulWidget {
  num valor;
  SuccesfullPayment({required this.valor, Key? key}) : super(key: key);

  @override
  State<SuccesfullPayment> createState() => _SuccesfullPaymentState();
}

class _SuccesfullPaymentState extends State<SuccesfullPayment> {
 late final reservaGuardadaProvider;
  late final userGuardadoProvider;
  late final hotelGuardarProvider;
  late final reservaRegistrada;
  late final hotelContainterProvider;

  final ReservasApi reservasApi =  ReservasApi();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reservaGuardadaProvider = Provider.of<RoomProvider>(context, listen: false);
    userGuardadoProvider = Provider.of<UserProvider>(context, listen: false);
    hotelGuardarProvider = Provider.of<HotelInfoProvider>(context, listen: false);
    reservaRegistrada = Provider.of<ProviderReserva>(context, listen: false);
    hotelContainterProvider = Provider.of<HotelProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191C25),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '¡Su pago ha sido registrado exitosamente!',
                textAlign: TextAlign.center,
                style: GoogleFonts.leagueGothic(
                    color: HexColor('E9BD44'),
                    fontWeight: FontWeight.normal,
                    fontSize: 40.0),
              ),
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
                  Reserva reserva = Reserva(
                      codigoReserva: userGuardadoProvider.getUser.email,
                      nombre: reservaGuardadaProvider.getRoom.nombre,
                      precio: reservaGuardadaProvider.getRoom.precio,
                      numeroCamas: reservaGuardadaProvider.getRoom.numeroCamas,
                      tamao: reservaGuardadaProvider.getRoom.tamao,
                      numeroHabitacion:
                          reservaGuardadaProvider.getRoom.numeroHabitacion,
                      capacidad: reservaGuardadaProvider.getRoom.capacidad,
                      correoCliente: userGuardadoProvider.getUser.email,
                      diasReserva: hotelContainterProvider.getdays,
                      estado: "Reservado",
                      fechaEntrada: "Hoy",
                      fechaSalida: "Hoy",
                      nombreCliente: userGuardadoProvider.getUser.names +
                          userGuardadoProvider.getUser.lastNames,
                      nombreHotel: hotelGuardarProvider.getHotel.nombre);
                  reservasApi.createReserva(hotelGuardarProvider.getIDHotel, reservaGuardadaProvider.getRoom.id, reserva.toMap());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResumenReserva(valor: widget.valor,),
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    "Ver reservación",
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
    );
  }
}

