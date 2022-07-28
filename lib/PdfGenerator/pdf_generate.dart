import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mercury_app/PdfGenerator/mobile_path.dart';
import 'package:mercury_app/Providers/_providereserva.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class GeneratePdf {
  Future<void> createPdf(ProviderReserva providerReserva, num valor) async {
    var tEntrada = DateFormat('dd/MM/yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(
            providerReserva.getReserva.fechaEntrada * 1000));
    var tSalida = DateFormat('dd/MM/yyyy').format(
        DateTime.fromMillisecondsSinceEpoch(
            (providerReserva.getReserva.fechaSalida * 1000) - 43200));
    PdfDocument document = PdfDocument();
    //Add a page to the PDF document
    PdfPage page = document.pages.add();
    

    //Create the header with specific bounds
    PdfPageTemplateElement header = PdfPageTemplateElement(
        Rect.fromLTWH(0, 0, document.pageSettings.size.width, 100));

//Create the date and time field
    PdfDateTimeField dateAndTimeField = PdfDateTimeField(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));
    dateAndTimeField.date = DateTime(2020, 2, 10, 13, 13, 13, 13, 13);
    dateAndTimeField.dateFormatString = 'E, MM.dd.yyyy';

//Create the composite field with date field
    PdfCompositeField compositefields = PdfCompositeField(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        text: 'Documento generado con fecha: ${DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now())}',
        fields: <PdfAutomaticField>[dateAndTimeField]);

//Add composite field in header
    compositefields.draw(header.graphics,
        Offset(0, 50 - PdfStandardFont(PdfFontFamily.timesRoman, 11).height));

//Add the header at top of the document
    document.template.top = header;

//Create the footer with specific bounds
    PdfPageTemplateElement footer = PdfPageTemplateElement(
        Rect.fromLTWH(0, 0, document.pageSettings.size.width, 50));

//Create the page number field
    PdfPageNumberField pageNumber = PdfPageNumberField(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));

//Sets the number style for page number
    pageNumber.numberStyle = PdfNumberStyle.upperRoman;

//Create the page count field
    PdfPageCountField count = PdfPageCountField(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));

//set the number style for page count
    count.numberStyle = PdfNumberStyle.upperRoman;

//Create the date and time field
    PdfDateTimeField dateTimeField = PdfDateTimeField(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 19),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)));

//Sets the date and time
    dateTimeField.date = DateTime(2020, 2, 10, 13, 13, 13, 13, 13);

//Sets the date and time format
    dateTimeField.dateFormatString = 'hh\':\'mm\':\'ss';

//Create the composite field with page number page count
    PdfCompositeField compositeField = PdfCompositeField(
        font: PdfStandardFont(PdfFontFamily.timesRoman, 15, style: PdfFontStyle.regular),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        text: 'Mercury Booking - ¡Gracias por confiar en nosotros, vuelva pronto!\nDudas o preguntas: mvalley1029@gmail.com',
        fields: <PdfAutomaticField>[pageNumber, count, dateTimeField]);
    compositeField.bounds = footer.bounds; compositeField.stringFormat = PdfStringFormat(alignment: PdfTextAlignment.right);

//Add the composite field in footer
    compositeField.draw(footer.graphics,
        Offset(-90, 30 - PdfStandardFont(PdfFontFamily.timesRoman, 15).height));

//Add the footer at the bottom of the document

//Create template and draw text in template graphics
    final PdfPageTemplateElement custom =
        PdfPageTemplateElement(Offset(0, 0) & page.getClientSize(), page);
    custom.dock = PdfDockStyle.fill;
    PdfGraphicsState state = custom.graphics.save();
    custom.graphics.drawString(
        'Reserva a nombre de: ${providerReserva.getReserva.nombreCliente}\n'
        'Código de reserva:\n${providerReserva.getReserva.codigoReserva}\n'
        'Número de habitación: ${providerReserva.getReserva.numeroHabitacion}\n'
        'Correo electrónico huésped: ${providerReserva.getReserva.correoCliente}\n'
        'Número de camas: ${providerReserva.getReserva.numeroCamas.toString()} cama(s)\n'
        'Capacidad habitación: ${providerReserva.getReserva.capacidad.toString()} persona(s)\n'
        'Tamaño de la habitación: ${providerReserva.getReserva.tamao.toString()} m2\n'
        'Fecha de llegada: ${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(providerReserva.getReservaFinal.fechaEntrada * 1000))}\n'
        'Fecha de salida: ${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(providerReserva.getReservaFinal.fechaSalida * 1000))}\n'
        'Total cancelado: \$${valor.toString()}',
        PdfStandardFont(PdfFontFamily.timesRoman, 20, style: PdfFontStyle.regular),
        bounds: const Rect.fromLTWH(10, 10, 0, 0), format: PdfStringFormat(lineSpacing: 20));
    custom.graphics.restore(state);

//Add template as a stamp to the PDF document
    document.template.stamps.add(custom);

//Draw rectangle to the page graphics
    page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: 5),
        brush: PdfBrushes.lightGray,
        bounds: Offset(0, 0) & page.getClientSize());
    document.template.bottom = footer;

    final List<int> bytes = document.saveSync();
    document.dispose();

    saveAndLaunchFile(bytes, 'Reserva Generada - Mercury.pdf');
  }
}
