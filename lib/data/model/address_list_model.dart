class AddressListModel {
  AddressListModel({
    required this.success,
    required this.message,
    required this.addressList,
  });
  late final bool success;
  late final String message;
  late final List<AddressList> addressList;

  AddressListModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    addressList = List.from(json['address_list']).map((e)=>AddressList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['address_list'] = addressList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AddressList {
  AddressList({
    required this.addressId,
    required this.userId,
    required this.title,
    required this.gpsAddress,
    required this.latitude,
    required this.longitude,
  });
  late final int addressId;
  late final int userId;
  late final String title;
  late final String gpsAddress;
  late final String latitude;
  late final String longitude;

  AddressList.fromJson(Map<String, dynamic> json){
    addressId = json['address_id'];
    userId = json['user_id'];
    title = json['title'];
    gpsAddress = json['gps_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address_id'] = addressId;
    _data['user_id'] = userId;
    _data['title'] = title;
    _data['gps_address'] = gpsAddress;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    return _data;
  }
}