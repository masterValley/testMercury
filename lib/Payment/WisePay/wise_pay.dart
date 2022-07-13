import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class WisePayment extends StatefulWidget {
  const WisePayment({Key? key}) : super(key: key);

  @override
  State<WisePayment> createState() => _WisePaymentState();
}

class _WisePaymentState extends State<WisePayment> {
  var currency = ['United States Dollar', 'Euro'];
  String initialvalue = 'United States Dollar';

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
                  style: GoogleFonts.leagueGothic(
                      color: HexColor('#37517e'),
                      fontSize: 40,
                      fontWeight: FontWeight.normal),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 15.0),
                  child: Text(
                    'Jorge Enrique Sarmiento Ordoñez',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.leagueGothic(
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
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Ingrese el monto"),
                          keyboardType: TextInputType.number,
                        )),
                    DropdownButton(
                      style: GoogleFonts.roboto(
                          fontStyle: FontStyle.italic,
                          color: HexColor('191C25')),
                      value: initialvalue,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      items: currency.map((String items) {
                        return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: GoogleFonts.roboto(
                                  color: HexColor('191C25')),
                            ));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          initialvalue = newValue!;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
