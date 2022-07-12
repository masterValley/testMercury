import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStart extends StatefulWidget {
  const HomeStart({Key? key}) : super(key: key);

  @override
  State<HomeStart> createState() => _HomeStartState();
}

class _HomeStartState extends State<HomeStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff191C25),
        body: Container(
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("lib/Images/background.jpg"), fit: BoxFit.cover, opacity: 0.2)),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'MERCURY',
                  style: GoogleFonts.leagueGothic(
                      fontSize: 80, color: const Color(0xfff2f2f2)),
                ),
              ),
              Center(
                child: Text(
                  'BOOKING',
                  style: GoogleFonts.leagueGothic(
                      fontWeight: FontWeight.w100,
                      fontSize: 45,
                      color: const Color(0xffe9bd44)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Text(
                    'El reservar una habitación nunca había sido tan placentero',
                    style: GoogleFonts.roboto(
                        fontSize: 16, color: const Color(0xfff2f2f2)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffe9bd44)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 32, right: 32, top: 16, bottom: 16),
                      child: Text(
                        "EMPEZAR",
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
        ));
  }
}
