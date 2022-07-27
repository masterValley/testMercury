import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mercury_app/Models/user.dart';
import 'package:mercury_app/Payment/payment.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:mercury_app/Providers/_providerhotelinfo.dart';
import 'package:mercury_app/Providers/_provideruser.dart';
import 'package:mercury_app/apis/_userapi.dart';
import 'package:provider/provider.dart';

class ClienteView extends StatefulWidget {
  num valor;
  ClienteView({required this.valor, Key? key}) : super(key: key);

  @override
  State<ClienteView> createState() => _ClienteViewState();
}

TextEditingController _names = TextEditingController();
TextEditingController _lastNames = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _emailValidator = TextEditingController();
TextEditingController _CI = TextEditingController();

bool _emailCorrect = false;

final UserApi userApi = UserApi();

class _ClienteViewState extends State<ClienteView> {
  late final reservaProvider;
  late final hotelGuardarProvider;
  @override
  void initState() {
    super.initState();
    reservaProvider = Provider.of<HotelProvider>(context, listen: false);
    hotelGuardarProvider = Provider.of<HotelInfoProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191C25),
      appBar: AppBar(
        backgroundColor: const Color(0xff191C25),
        elevation: 0,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Text("Introduce tus datos",
                  style: GoogleFonts.leagueGothic(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#E9BD44'))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 25.0, 0.0, 0.0),
              child: Text("Nombres:",
                  style: GoogleFonts.leagueGothic(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: HexColor('#E9BD44'))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 252, 244)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintMaxLines: 2,
                    hintStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: const Color(0xff191c25)),
                    hintText: 'Nombres',
                    border: InputBorder.none,
                  ),
                  controller: _names,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: const Color(0xff191c25))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Text("Apellidos:",
                  style: GoogleFonts.leagueGothic(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: HexColor('#E9BD44'))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 252, 244)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintMaxLines: 2,
                    hintStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: const Color(0xff191c25)),
                    hintText: 'Apellidos',
                    border: InputBorder.none,
                  ),
                  controller: _lastNames,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: const Color(0xff191c25))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Text("Email:",
                  style: GoogleFonts.leagueGothic(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: HexColor('#E9BD44'))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 252, 244)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintMaxLines: 2,
                    hintStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: const Color(0xff191c25)),
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                  controller: _email,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: const Color(0xff191c25))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Text("Confirmar Email:",
                  style: GoogleFonts.leagueGothic(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: HexColor('#E9BD44'))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  onChanged: (value) {
                    _emailCorrect = value == _email.text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 252, 244)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintMaxLines: 2,
                    hintStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: const Color(0xff191c25)),
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                  controller: _emailValidator,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: const Color(0xff191c25))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Text("Cédula o Pasaporte:",
                  style: GoogleFonts.leagueGothic(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: HexColor('#E9BD44'))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 255, 252, 244)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintMaxLines: 2,
                    hintStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: const Color(0xff191c25)),
                    hintText: 'Cédula o Pasaporte',
                    border: InputBorder.none,
                  ),
                  controller: _CI,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: const Color(0xff191c25))),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
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
                  User user = new User(names: _names.text, lastNames: _lastNames.text, CI: _CI.text, email: _email.text);
                  userApi.createUser(user.toMap(), hotelGuardarProvider.getIDHotel);
                  Provider.of<UserProvider>(context, listen: false)
                      .setUserValues(
                          _names.text, _lastNames.text, _email.text, _CI.text);
                  _emailCorrect == true &&
                          _names.text.isNotEmpty &&
                          _lastNames.text.isNotEmpty &&
                          _email.text.isNotEmpty &&
                          _emailValidator.text.isNotEmpty &&
                          _CI.text.isNotEmpty
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PaymentPage(valor: widget.valor),
                          ))
                      : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: HexColor("#E9BD44"),
                          content: Text(
                            "Debe ingresar todos los datos solicitados",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                color: const Color(0xff191c25)),
                            textAlign: TextAlign.center,
                          ),
                        ));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    "Generar orden de pago",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: const Color(0xff191c25)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
