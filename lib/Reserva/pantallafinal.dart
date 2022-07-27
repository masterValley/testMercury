import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mercury_app/PdfGenerator/mobile_path.dart';
import 'package:mercury_app/PdfGenerator/pdf_generate.dart';
import 'package:mercury_app/Providers/_providereserva.dart';
import 'package:mercury_app/Providers/_providerhotel.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class FinalPage extends StatefulWidget {
  num valor;
  FinalPage({required this.valor, Key? key}) : super(key: key);

  @override
  State<FinalPage> createState() => _FinalPageState();
}

class _FinalPageState extends State<FinalPage> {
  late final reservaRegistrada;
  late final hotelContainterProvider;
  final GeneratePdf generatePdf = GeneratePdf();
  @override
  void initState() {
    // TODO: implement initState
    reservaRegistrada = Provider.of<ProviderReserva>(context, listen: false);
    hotelContainterProvider =
        Provider.of<HotelProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#191C25"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '¡Tu reserva ha sido registrada!',
                textAlign: TextAlign.center,
                style: GoogleFonts.leagueGothic(
                    color: HexColor('E9BD44'),
                    fontWeight: FontWeight.normal,
                    fontSize: 40.0),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Puedes acceder a la información de tu reserva generando el archivo correspondiente',
                textAlign: TextAlign.center,
                style: GoogleFonts.leagueGothic(
                    color: HexColor('#F2F2F2'),
                    fontWeight: FontWeight.normal,
                    fontSize: 30.0),
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
                onPressed: () async {
                  generatePdf.createPdf(reservaRegistrada, widget.valor);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    "Generar documento",
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
                onPressed: () async {},
                child: Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    "Volver al inicio",
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


