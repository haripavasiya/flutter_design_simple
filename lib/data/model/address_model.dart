class AddressModel {
  int? id;
  String? contactPersonNumber;
  String? address;
  String? latitude;
  String? longitude;
  String? method;
  String? contactPersonName;
  String? road;
  String? house;
  String? floor;

  AddressModel({
    this.id,
    this.contactPersonNumber,
    this.address,
    this.latitude,
    this.longitude,
    this.method,
    this.contactPersonName,
    this.road,
    this.house,
    this.floor,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contactPersonNumber = json['contact_person_number'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    method = json['_method'];
    contactPersonName = json['contact_person_name'];
    floor = json['floor'];
    road = json['road'];
    house = json['house'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contact_person_number'] = this.contactPersonNumber;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['_method'] = this.method;
    data['contact_person_name'] = this.contactPersonName;
    data['road'] = this.road;
    data['house'] = this.house;
    data['floor'] = this.floor;
    return data;
  }
}
