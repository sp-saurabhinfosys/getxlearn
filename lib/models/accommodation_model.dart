import 'package:getxlearn/models/address_model.dart';

class Accommodation {
  String? name;
  String? description;
  String? email;
  String? website;
  String? phoneCode;
  String? phone;
  List<String>? picturesUrl;
  String? instagram;
  List<String>? facilities;
  Address? address;

  Accommodation(
      {this.name,
        this.description,
        this.email,
        this.website,
        this.phoneCode,
        this.phone,
        this.picturesUrl,
        this.instagram,
        this.facilities,
        this.address});

  Accommodation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    email = json['email'];
    website = json['website'];
    phoneCode = json['phoneCode'];
    phone = json['phone'];
    picturesUrl = json['picturesUrl'].cast<String>();
    instagram = json['instagram'];
    facilities = json['facilities'].cast<String>();
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['email'] = email;
    data['website'] = website;
    data['phoneCode'] = phoneCode;
    data['phone'] = phone;
    data['picturesUrl'] = picturesUrl;
    data['instagram'] = instagram;
    data['facilities'] = facilities;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}




