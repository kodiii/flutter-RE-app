import 'package:flutter/material.dart';
import 'package:flutter_app_real_estate/widgets/pdf_style_form.dart';
import 'package:flutter_app_real_estate/services/pdf_printer.dart';

class PdfStyleScreen extends StatefulWidget {
  @override
  _PdfStyleScreenState createState() => _PdfStyleScreenState();
}

class _PdfStyleScreenState extends State<PdfStyleScreen> {
  final _formKey = GlobalKey<FormState>();
  String _color;
  String _logo;

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      PdfPrinter.printPdf(_color, _logo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Style PDF'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              PdfStyleForm(
                onSavedColor: (value) => _color = value,
                onSavedLogo: (value) => _logo = value,
              ),
              RaisedButton(
                child: Text('Submit'),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}