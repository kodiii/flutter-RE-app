import 'package:flutter/material.dart';
import 'package:flutter_app_real_estate/assets/styles/colors.dart';
import 'package:flutter_app_real_estate/assets/styles/fonts.dart';
import 'package:flutter_app_real_estate/utils/validators.dart';

class PdfStyleForm extends StatefulWidget {
  @override
  _PdfStyleFormState createState() => _PdfStyleFormState();
}

class _PdfStyleFormState extends State<PdfStyleForm> {
  final _formKey = GlobalKey<FormState>();
  String _color = '';
  String _logoImage = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Color'),
            validator: colorValidator,
            onSaved: (value) => _color = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Logo Image'),
            validator: imageValidator,
            onSaved: (value) => _logoImage = value,
          ),
          RaisedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // TODO: Implement functionality to apply the style to the PDF
    }
  }
}