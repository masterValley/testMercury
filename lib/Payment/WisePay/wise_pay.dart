import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class WisePayment extends StatefulWidget {
  const WisePayment({Key? key}) : super(key: key);

  @override
  State<WisePayment> createState() => _WisePaymentState();
}

class _WisePaymentState extends State<WisePayment> {
  TextEditingController montocontroller = TextEditingController();

  var currency = ['USD', 'Euro'];
  var paymethod = [
    'Tarjeta débito',
    'Tarjeta crédito',
    'Conectar con una entidad bancaria',
    'Wise transfer'
  ];

  String initialvalue = 'USD';
  String initialvaluemethod = 'Tarjeta débito';

  double tarifa = 0.72;
  double tarifaWise = 4.14;
  double monto = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('FFFFFF'),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: HexColor('FFFFFF')),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Bienvenido a Wise',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      color: HexColor('#37517e'),
                      fontSize: 40,
                      fontWeight: FontWeight.normal),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
                  child: Text(
                    'Jorge Enrique Sarmiento Ordoñez',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        color: HexColor('#37517e'),
                        fontSize: 40,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: 120,
                        child: TextField(
                          onSubmitted: (value) {
                            setState(() {
                              value.isNotEmpty || value != "0"
                                  ? monto =
                                      double.parse(value) + tarifa + tarifaWise
                                  : showSnack("Campo Obligatorio");
                            });
                          },
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(color: HexColor('#565656')),
                          controller: montocontroller,
                          decoration: InputDecoration(
                              hintText: "Ingrese el monto",
                              labelStyle: GoogleFonts.roboto(
                                  fontStyle: FontStyle.italic,
                                  color: HexColor('191C25'))),
                          keyboardType: TextInputType.number,
                        )),
                    DropdownButton(
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.italic,
                          color: HexColor('#565656')),
                      value: initialvalue,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      items: currency.map((String items) {
                        return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: GoogleFonts.roboto(
                                  color: HexColor('#565656')),
                            ));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          initialvalue = newValue!;
                        });
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Seleccione un método de pago",
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.italic,
                          color: HexColor('#565656'),
                          fontWeight: FontWeight.bold)),
                ),
                DropdownButton(
                  style: GoogleFonts.roboto(
                      fontStyle: FontStyle.italic, color: HexColor('#565656')),
                  value: initialvaluemethod,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  items: paymethod.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: GoogleFonts.roboto(color: HexColor('#565656')),
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      initialvaluemethod = newValue!;
                    });
                  },
                ),
                Text(
                  "Tarifa Wise - $tarifaWise $initialvalue",
                  style: GoogleFonts.leagueGothic(
                      color: HexColor('#565656'),
                      fontSize: 20,
                      fontWeight: FontWeight.w100),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 10.0),
                      child: Text(
                        "$tarifa",
                        style: GoogleFonts.roboto(
                            color: HexColor('#565656'),
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Card(
                        color: HexColor("#37517e"),
                        child: CircleAvatar(
                          backgroundColor: HexColor("#37517e"),
                          child: Text(
                            initialvalue,
                            style: GoogleFonts.roboto(
                                color: HexColor('#FFFFFF'),
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Nuestra tarifa",
                        style: GoogleFonts.roboto(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: HexColor('#565656'),
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 10.0),
                      child: displayPay(tarifaWise, tarifa),
                    ),
                    Card(
                        color: HexColor("#37517e"),
                        child: CircleAvatar(
                          backgroundColor: HexColor("#37517e"),
                          child: Text(
                            initialvalue,
                            style: GoogleFonts.roboto(
                                color: HexColor('#FFFFFF'),
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Tarifa total",
                        style: GoogleFonts.roboto(
                            fontStyle: FontStyle.italic,
                            color: HexColor('#565656'),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 10.0),
                        child: Text(monto.toStringAsFixed(2),
                            style: GoogleFonts.roboto(
                                color: HexColor('#565656'),
                                fontSize: 25,
                                fontWeight: FontWeight.w300))),
                    Card(
                        color: HexColor("#37517e"),
                        child: CircleAvatar(
                          backgroundColor: HexColor("#37517e"),
                          child: Text(
                            initialvalue,
                            style: GoogleFonts.roboto(
                                color: HexColor('#FFFFFF'),
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Total a Pagar",
                        style: GoogleFonts.roboto(
                            fontStyle: FontStyle.italic,
                            color: HexColor('#565656'),
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
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
                    onPressed: () {},
                    child: Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        "Realizar Pago",
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
        ),
      ),
    );
  }
}

Text displayPay(double tarifaWise, double tarifaNormal) {
  double totalPay = tarifaNormal + tarifaWise;
  return Text(totalPay.toStringAsFixed(2),
      style: GoogleFonts.roboto(
          color: HexColor('#565656'),
          fontSize: 25,
          fontWeight: FontWeight.w300));
}

SnackBar showSnack(String text) {
  return SnackBar(
      content: Text(text,
          style: GoogleFonts.roboto(
              color: HexColor('#565656'),
              fontSize: 12,
              fontWeight: FontWeight.w300)),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          // Some code to undo the change.
        },
      ));
}
