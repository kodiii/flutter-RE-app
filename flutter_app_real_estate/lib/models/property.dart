```dart
class Property {
  String propertyName;
  String propertyType;
  int nrOfRooms;
  int nrOfBathrooms;
  int nrOfGarages;
  double area;
  String otherSpecifications;
  double propertyPrice;
  List<String> photos;

  Property({
    this.propertyName,
    this.propertyType,
    this.nrOfRooms,
    this.nrOfBathrooms,
    this.nrOfGarages,
    this.area,
    this.otherSpecifications,
    this.propertyPrice,
    this.photos,
  });

  Property.fromJson(Map<String, dynamic> json) {
    propertyName = json['propertyName'];
    propertyType = json['propertyType'];
    nrOfRooms = json['nrOfRooms'];
    nrOfBathrooms = json['nrOfBathrooms'];
    nrOfGarages = json['nrOfGarages'];
    area = json['area'];
    otherSpecifications = json['otherSpecifications'];
    propertyPrice = json['propertyPrice'];
    photos = json['photos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['propertyName'] = this.propertyName;
    data['propertyType'] = this.propertyType;
    data['nrOfRooms'] = this.nrOfRooms;
    data['nrOfBathrooms'] = this.nrOfBathrooms;
    data['nrOfGarages'] = this.nrOfGarages;
    data['area'] = this.area;
    data['otherSpecifications'] = this.otherSpecifications;
    data['propertyPrice'] = this.propertyPrice;
    data['photos'] = this.photos;
    return data;
  }
}
```