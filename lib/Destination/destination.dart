import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mercury_app/Models/_destino.dart';
import 'package:mercury_app/Providers/providerHotel.dart';
import 'package:mercury_app/apis/_destinoapi.dart';
import 'package:provider/provider.dart';

import '../Hotels/hotels.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({Key? key}) : super(key: key);

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  String destinoName = 'Destino';
  String fechaLlegadaText = 'Fecha de llegada';
  DateTime _fechaLlegada = DateTime.now();
  String fechaSalidaText = 'Fecha de salida';
  DateTime _fechaSalida = DateTime.now();
  TextEditingController destinoController = TextEditingController();
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
                                      child: TextButton(
                                          child: Text(
                                            fechaLlegadaText,
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 20,
                                                color: const Color(0xff191c25)),
                                          ),
                                          onPressed: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2025),
                                              helpText:
                                                  'Seleccionar fecha de llegada', // Can be used as title
                                              cancelText: 'Cancelar',
                                              confirmText: 'Seleccionar',
                                              initialEntryMode:
                                                  DatePickerEntryMode
                                                      .calendarOnly,
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                        const ColorScheme.light(
                                                      primary: Color(
                                                          0xffe9bd44), // header background color
                                                      onPrimary: Color(
                                                          0xff191c25), // header text color
                                                      onSurface: Color(
                                                          0xff191c25), // body text color
                                                    ),
                                                    textButtonTheme:
                                                        TextButtonThemeData(
                                                      style: TextButton.styleFrom(
                                                          textStyle: GoogleFonts
                                                              .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16),
                                                          primary: const Color(
                                                              0xff191c25) // button text color
                                                          ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            ).then((date) {
                                              setState(() {
                                                _fechaLlegada = date!;
                                                fechaLlegadaText =
                                                    DateFormat.yMMMd()
                                                        .format(_fechaLlegada)
                                                        .toString();
                                              });
                                            });
                                          }),
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
                                      child: TextButton(
                                          child: Text(
                                            fechaSalidaText,
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 20,
                                                color: const Color(0xff191c25)),
                                          ),
                                          onPressed: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2025),
                                              helpText:
                                                  'Seleccionar fecha de Salida', // Can be used as title
                                              cancelText: 'Cancelar',
                                              confirmText: 'Seleccionar',
                                              initialEntryMode:
                                                  DatePickerEntryMode
                                                      .calendarOnly,
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                        const ColorScheme.light(
                                                      primary: Color(
                                                          0xffe9bd44), // header background color
                                                      onPrimary: Color(
                                                          0xff191c25), // header text color
                                                      onSurface: Color(
                                                          0xff191c25), // body text color
                                                    ),
                                                    textButtonTheme:
                                                        TextButtonThemeData(
                                                      style: TextButton.styleFrom(
                                                          textStyle: GoogleFonts
                                                              .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 16),
                                                          primary: const Color(
                                                              0xff191c25) // button text color
                                                          ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            ).then((date) {
                                              setState(() {
                                                _fechaSalida = date!;
                                                fechaSalidaText =
                                                    DateFormat.yMMMd()
                                                        .format(_fechaSalida)
                                                        .toString();
                                              });
                                            });
                                          }),
                                    ),
                                  ))
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
                        onPressed: () {
                          debugPrint(destinoName);
                          debugPrint(_fechaLlegada.toString());
                          debugPrint(_fechaSalida.toString());
                          Provider.of<HotelProvider>(context, listen: false)
                              .setValues(
                                  destinoName, _fechaLlegada, _fechaSalida);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HotelsList()));
                        },
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
