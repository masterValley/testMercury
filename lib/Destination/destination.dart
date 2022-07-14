import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff191C25),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff191C25),
          foregroundColor: const Color(0xfff2f2f2),
        ),
        body: Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(top: 0, left: 32, right: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.left,
                'MERCURY',
                style: GoogleFonts.leagueGothic(
                    fontSize: 60, color: const Color(0xffe9bd44)),
              ),
              Text(
                textAlign: TextAlign.left,
                'La mejor experiencia en hospedajes',
                style: GoogleFonts.leagueGothic(
                    fontSize: 45, color: const Color(0xfff2f2f2)),
              ),
              Container(
              )
            ],
          ),
        ));
  }
}
