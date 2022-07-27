
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mercury_app/Models/reserva.dart';
import 'package:mercury_app/Payment/WisePay/wise_pay.dart';
import 'package:mercury_app/Payment/succesfullpayment.dart';
import 'package:mercury_app/Providers/_providereserva.dart';
import 'package:mercury_app/Providers/_providerhabitacion.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:mercury_app/Providers/_provideruser.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  num valor;
  PaymentPage({required this.valor, Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late final _providerUser;
  late final _providerHotels;
  late final _providerHabitacion;
  late final _providerContainer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _providerUser = Provider.of<UserProvider>(context, listen: false);
    _providerHotels = Provider.of<HotelInfoProvider>(context, listen: false);
    _providerHabitacion = Provider.of<RoomProvider>(context, listen: false);
    _providerContainer = Provider.of<HotelProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191C25),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff191C25),
        foregroundColor: const Color(0xfff2f2f2),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Precio a pagar :',
                style: GoogleFonts.roboto(
                    color: HexColor('F2F2F2'), fontWeight: FontWeight.normal),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$${widget.valor}", //aqui va $variable.precio
                style: GoogleFonts.roboto(
                    color: HexColor('#E9BD44'),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Selecciona el método de pago',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.leagueGothic(
                      color: HexColor('E9BD44'),
                      fontWeight: FontWeight.normal,
                      fontSize: 40.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    Provider.of<ProviderReserva>(context, listen: false).setReserva(
                      Reserva(
                        codigoReserva: _providerHabitacion.getRoom.id, 
                        nombre: _providerHabitacion.getRoom.nombre, 
                        precio: _providerHabitacion.getRoom.precio, 
                        numeroCamas: _providerHabitacion.getRoom.numeroCamas, 
                        tamao: _providerHabitacion.getRoom.tamao, 
                        numeroHabitacion: _providerHabitacion.getRoom.numeroHabitacion, 
                        capacidad: _providerHabitacion.getRoom.capacidad, 
                        correoCliente: _providerUser.getUser.email, 
                        diasReserva: 10, 
                        estado: "vacio", 
                        fechaEntrada: "ahiora",
                        fechaSalida: "Ahora", 
                        nombreCliente: _providerUser.getUser.names + _providerUser.getUser.lastNames,
                        nombreHotel: _providerHotels.getHotel.nombre,
                        
                        )
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccesfullPayment(valor: widget.valor),
                        ));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: HexColor('F2F2F2'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Paypal',
                            style: GoogleFonts.roboto(
                                color: HexColor('565656'),
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: Icon(
                            color: Color(0xff003087),
                            Icons.paypal,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WisePayment(),
                        ));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: HexColor('F2F2F2'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Wise',
                            style: GoogleFonts.roboto(
                                color: HexColor('565656'),
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: ImageIcon(
                            color: Color(0xff00b9ff),
                            AssetImage('lib/Images/wise.png'),
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: HexColor('F2F2F2'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Transferencia bancaria',
                            style: GoogleFonts.roboto(
                                color: HexColor('565656'),
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                          child: ImageIcon(
                            color: Color(0xff2a593f),
                            AssetImage('lib/Images/bank.png'),
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
