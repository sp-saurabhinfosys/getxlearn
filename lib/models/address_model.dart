import 'package:getxlearn/models/location_model.dart';

class Address {
  String? country;
  String? city;
  String? address;
  String? postCode;
  Location? location;

  Address(
      {this.country, this.city, this.address, this.postCode, this.location});

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
    address = json['address'];
    postCode = json['postCode'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['city'] = city;
    data['address'] = address;
    data['postCode'] = postCode;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}