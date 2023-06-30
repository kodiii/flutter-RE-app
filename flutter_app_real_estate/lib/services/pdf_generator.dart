import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app_real_estate/models/property.dart';

class PdfGenerator {
  Future<String> generatePdf(Property property) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            children: [
              pw.Text('Property Details', style: pw.TextStyle(fontSize: 40)),
              pw.SizedBox(height: 20),
              pw.Text('Property Name: ${property.name}'),
              pw.Text('Property Type: ${property.type}'),
              pw.Text('Number of Rooms: ${property.nrOfRooms}'),
              pw.Text('Number of Bathrooms: ${property.nrOfBathrooms}'),
              pw.Text('Number of Garages: ${property.nrOfGarages}'),
              pw.Text('Area: ${property.area} m2'),
              pw.Text('Other Specifications: ${property.otherSpecifications}'),
              pw.Text('Property Price: €${property.price}'),
              pw.Image(pw.MemoryImage(property.photos)),
            ],
          ),
        ),
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/property.pdf');
    await file.writeAsBytes(await pdf.save());

    return file.path;
  }
}