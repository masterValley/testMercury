// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mercury_app/Payment/WisePay/wise_pay.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('1E1E1E'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor('1E1E1E'),
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
                "\$${'180.00'}", //aqui va $widget.precio
                style: GoogleFonts.roboto(
                    color: HexColor('E9BD44'), fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: HexColor('1E1E1E')),
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
                  onTap: () {},
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
                          child: Icon(
                            Icons.payment,
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
                          child: Icon(
                            Icons.business_center,
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
