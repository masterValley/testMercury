import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mercury_app/Payment/payment.dart';
import 'package:mercury_app/Providers/_provideruser.dart';
import 'package:provider/provider.dart';

class ClienteView extends StatefulWidget {
  const ClienteView({Key? key}) : super(key: key);

  @override
  State<ClienteView> createState() => _ClienteViewState();
}

TextEditingController _names = TextEditingController();
TextEditingController _lastNames = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _emailValidator = TextEditingController();
TextEditingController _CI = TextEditingController();

bool _emailCorrect = false;

class _ClienteViewState extends State<ClienteView> {
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
                "\$${'180.00'}", //aqui va $variable.precio
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
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: HexColor('#E9BD44'))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 25.0, 0.0, 0.0),
              child: Text("Nombres:",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: HexColor("#FFFFFF"))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 255, 252, 244)),
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
                      color: const Color(0xff191c25) )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Text("Apellidos:",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: HexColor("#FFFFFF"))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 255, 252, 244)),
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
                      color: const Color(0xff191c25) )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Text("Email:",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: HexColor("#FFFFFF"))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 255, 252, 244)),
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
                      color: const Color(0xff191c25) )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Text("Confirmar Email:",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: HexColor("#FFFFFF"))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  onChanged: (value) {
                    _emailCorrect = value == _email.text;
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 255, 252, 244)),
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
                      color: const Color(0xff191c25) )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0.0, 0.0),
              child: Text("Cédula o Pasaporte:",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: HexColor("#FFFFFF"))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: HexColor("FFFFFF"),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 255, 254, 251)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 255, 252, 244)),
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
                      color: const Color(0xff191c25) )),
            ),
            Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
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
                      Provider.of<UserProvider>(context, listen: false)
                      .setUserValues(_names.text, _lastNames.text, _email.text, _CI.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentPage(),));
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
