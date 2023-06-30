import 'package:flutter/material.dart';
import 'package:flutter_app_real_estate/models/property.dart';
import 'package:flutter_app_real_estate/utils/validators.dart';

class PropertyForm extends StatefulWidget {
  final Function(Property) onSubmit;

  PropertyForm({@required this.onSubmit});

  @override
  _PropertyFormState createState() => _PropertyFormState();
}

class _PropertyFormState extends State<PropertyForm> {
  final _formKey = GlobalKey<FormState>();
  final _property = Property();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Property Name'),
            validator: Validators.nonEmpty,
            onSaved: (value) => _property.name = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Property Type'),
            validator: Validators.nonEmpty,
            onSaved: (value) => _property.type = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Number of Rooms'),
            validator: Validators.number,
            onSaved: (value) => _property.nrOfRooms = int.parse(value),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Number of Bathrooms'),
            validator: Validators.number,
            onSaved: (value) => _property.nrOfBathrooms = int.parse(value),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Number of Garages'),
            validator: Validators.number,
            onSaved: (value) => _property.nrOfGarages = int.parse(value),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Area (m2)'),
            validator: Validators.number,
            onSaved: (value) => _property.area = double.parse(value),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Other Specifications'),
            onSaved: (value) => _property.otherSpecifications = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Property Price (€)'),
            validator: Validators.number,
            onSaved: (value) => _property.price = double.parse(value),
          ),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                widget.onSubmit(_property);
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}