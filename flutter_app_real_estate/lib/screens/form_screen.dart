```dart
import 'package:flutter/material.dart';
import 'package:flutter_app_real_estate/models/property.dart';
import 'package:flutter_app_real_estate/services/pdf_generator.dart';
import 'package:flutter_app_real_estate/services/pdf_printer.dart';
import 'package:flutter_app_real_estate/widgets/property_form.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Property _property = Property();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PropertyForm(
            formKey: _formKey,
            property: _property,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitForm,
        child: Icon(Icons.check),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      PdfGenerator.generate(_property).then((pdfFile) {
        PdfPrinter.printPdf(pdfFile);
      });
    }
  }
}
```