import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercury_app/Models/_destino.dart';
import 'package:mercury_app/apis/_destinoapi.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  String destinoName = 'Destino';
  TextEditingController destinoController = TextEditingController();
  TextEditingController salidaController = TextEditingController();
  TextEditingController llegadaController = TextEditingController();
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
          margin: const EdgeInsets.only(top: 0, left: 32, right: 32),
          child: ListView(
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
                margin: const EdgeInsets.only(top: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        textAlign: TextAlign.left,
                        'Destino:',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: const Color(0xfff2f2f2)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfff2f2f2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 16, right: 16),
                      child: TypeAheadField<Destino?>(
                        textFieldConfiguration: TextFieldConfiguration(
                          minLines: 1,
                          maxLines: 2,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                color: const Color(0xff191c25)),
                            controller: destinoController,
                            decoration: InputDecoration(
                              hintMaxLines: 2,
                              hintStyle: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: const Color(0xff191c25)),
                              hintText: 'Buscar destino',
                              border: InputBorder.none,
                            )),
                        suggestionsCallback: DestinoApi.getDestinosSuggestions,
                        itemBuilder: (context, Destino? suggestion) {
                          final destino = suggestion!;
                          return ListTile(
                              tileColor: const Color(0xfff2f2f2),
                              title: Text(
                                destino.name,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: const Color(0xff191c25)),
                              ));
                        },
                        onSuggestionSelected: (Destino? suggestion) {
                          final destino = suggestion!;
                          destinoController.text = destino.name;
                          destinoName = destinoController.text;
                          print(destinoName);
                        },
                        noItemsFoundBuilder: (context) => const Center(
                            child: Text('No se encontró el destino')),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(top: 32, right: 8),
                          width: 170,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 16, bottom: 16),
                                child: Text(
                                  textAlign: TextAlign.left,
                                  'Llegada:',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: const Color(0xfff2f2f2)),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff2f2f2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 16),
                                  child: SizedBox(
                                    height: 60,
                                    child: Center(
                                      child: Text(
                                        'Fecha de llegada',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 20,
                                            color: const Color(0xff191c25)),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(top: 32, left: 8),
                          width: 170,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 16, bottom: 16),
                                child: Text(
                                  textAlign: TextAlign.left,
                                  'Salida:',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: const Color(0xfff2f2f2)),
                                ),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff2f2f2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, left: 16, right: 16),
                                  child: SizedBox(
                                      height: 60,
                                      child: Center(
                                        child: Text(
                                          'Fecha de salida',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20,
                                              color: const Color(0xff191c25)),
                                        ),
                                      )))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 32),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
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
                            "Buscar hoteles",
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
            ],
          ),
        ));
  }
}
