import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercury_app/PdfGenerator/mobile_path.dart';
import 'package:mercury_app/Providers/_providereserva.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class GeneratePdf {
  Future<void> createPdf(ProviderReserva providerReserva, num valor) async {
    var tEntrada = DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(providerReserva.getReserva.fechaEntrada));
    var tSalida = DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(providerReserva.getReserva.fechaSalida));
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString("¡Gracias por reservar en MercuryBooking!",
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.left));


    PdfGrid grid = PdfGrid();
    grid.columns.add(count: 2);
    grid.headers.add(1);
    //Headers
    PdfGridRow header = grid.headers[0];
    header.style = PdfGridRowStyle(
    backgroundBrush: PdfBrushes.dimGray,
    textPen: PdfPens.yellow,
    textBrush: PdfBrushes.darkOrange,
    font: PdfStandardFont(PdfFontFamily.timesRoman, 12));
    header.cells[0].value = "ID";
    header.cells[1].value = "Descripción";
    //Rows
    PdfGridRow row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Hotel: ';
    row.cells[1].value = providerReserva.getReserva.nombreHotel;

    //
    row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Código de reserva: ';
    row.cells[1].value = providerReserva.getReserva.codigoReserva;
    row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Número de habitación: ';
    row.cells[1].value = providerReserva.getReserva.numeroHabitacion;
    row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Reserva a nombre de: ';
    row.cells[1].value = providerReserva.getReserva.nombreCliente;
    row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Correo electrónico: ';
    row.cells[1].value = providerReserva.getReserva.correoCliente;
    row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Número de camas: ';
    row.cells[1].value =
        '${providerReserva.getReserva.numeroCamas.toStringAsPrecision(1)} camas(s)';
    row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Capacidad: ';
    row.cells[1].value = '${providerReserva.getReserva.capacidad} persona(s)';
    row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Tamaño habitación: ';
    row.cells[1].value = '${providerReserva.getReserva.tamao} m2';
    row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Total cancelado: ';
    row.cells[1].value = '\$$valor';
    row = grid.rows.add(); 
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Fecha llegada: ';
    row.cells[1].value = '$tEntrada';
    row = grid.rows.add();
    row.style = PdfGridRowStyle(
      
    font: PdfStandardFont(PdfFontFamily.courier, 12));
    row.cells[0].value = 'Fecha salida: ';
    row.cells[1].value = '$tSalida';

    grid.draw(
        page: document.pages.add(),
        bounds: const Rect.fromLTWH(0.0, 0.0, 0.0, 0.0));

    final List<int> bytes = document.saveSync();
    document.dispose();

    saveAndLaunchFile(bytes, 'Reserva Generada - Mercury.pdf');
  }
}
