class UserData {
  UserData({
    required this.success,
    required this.Message,
    required this.userDetail,
  });
  late final bool success;
  late final String Message;
  late final UserDetail userDetail;

  UserData.fromJson(Map<String, dynamic> json){
    success = json['success'];
    Message = json['Message'];
    userDetail = UserDetail.fromJson(json['user_detail']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['Message'] = Message;
    _data['user_detail'] = userDetail.toJson();
    return _data;
  }
}

class UserDetail {
  UserDetail({
    required this.id,
    required this.status,
    required this.name,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.image,
    required this.deviceId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int status;
  late final String name;
  late final String lastName;
  late final String mobile;
  late final String email;
  late final String image;
  late final String deviceId;
  late final String createdAt;
  late final String updatedAt;

  UserDetail.fromJson(Map<String, dynamic> json){
    id = json['id'];
    status = json['status'];
    name = json['name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    image = json['image'];
    deviceId = json['device_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['status'] = status;
    _data['name'] = name;
    _data['last_name'] = lastName;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['image'] = image;
    _data['device_id'] = deviceId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}