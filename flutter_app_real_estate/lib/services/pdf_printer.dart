import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';

class PdfPrinter {
  final pw.Document pdf = pw.Document();

  Future<void> printPdf(pw.PageTheme pageTheme, List<pw.Widget> body) async {
    pdf.addPage(
      pw.MultiPage(
        theme: pageTheme,
        build: (pw.Context context) => body,
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/property.pdf';
    final File file = File(path);

    await file.writeAsBytes(await pdf.save());
    await OpenFile.open(path);
  }

  pw.PageTheme buildPageTheme(pw.PdfColor primaryColor, pw.PdfColor secondaryColor, String logoPath) {
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      theme: pw.ThemeData.withFont(
        base: pw.Font.ttf(await rootBundle.load("assets/fonts/base_font.ttf")),
        bold: pw.Font.ttf(await rootBundle.load("assets/fonts/bold_font.ttf")),
        icons: pw.Font.ttf(await rootBundle.load("assets/fonts/icon_font.ttf")),
      ),
      buildBackground: (pw.Context context) {
        return pw.FullPage(
          child: pw.Image(
            pw.MemoryImage(
              (await rootBundle.load(logoPath)).buffer.asUint8List(),
            ),
          ),
        );
      },
      buildForeground: (pw.Context context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Center(
            child: pw.Text(
              'Property Details',
              style: pw.TextStyle(
                color: primaryColor,
                fontSize: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}