class MyVehicleModel {
  MyVehicleModel({
    required this.success,
    required this.message,
    required this.userVehicleList,
  });
  late final bool success;
  late final String message;
  late final List<UserVehicleList> userVehicleList;

  MyVehicleModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    userVehicleList = List.from(json['user_vehicle_list']).map((e)=>UserVehicleList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['user_vehicle_list'] = userVehicleList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class UserVehicleList {
  UserVehicleList({
    required this.uvId,
    required this.uvStatus,
    required this.userId,
    required this.is_fav,
    required this.is_fav_Loading,
    required this.uvType,
    required this.uvBrand,
    required this.uvModel,
    required this.uvNumber,
    required this.uvImage,
    required this.uvCreated,
    required this.vtName,
    required this.bName,
    required this.vmName,
  });
  late final int uvId;
  late final int uvStatus;
  late final int userId;
  late int is_fav=0;
  late bool is_fav_Loading=false;
  late final int uvType;
  late final int uvBrand;
  late final int uvModel;
  late final String uvNumber;
  late final String uvImage;
  late final String uvCreated;
  late final String vtName;
  late final String bName;
  late final String vmName;

  UserVehicleList.fromJson(Map<String, dynamic> json){
    uvId = json['uv_id'];
    uvStatus = json['uv_status'];
    userId = json['user_id'];
    is_fav = json['is_fav'];
    uvType = json['uv_type'];
    uvBrand = json['uv_brand'];
    uvModel = json['uv_model'];
    uvNumber = json['uv_number'];
    uvImage = json['uv_image'];
    uvCreated = json['uv_created'];
    vtName = json['vt_name'];
    bName = json['b_name'];
    vmName = json['vm_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uv_id'] = uvId;
    _data['uv_status'] = uvStatus;
    _data['user_id'] = userId;
    _data['is_fav'] = is_fav;
    _data['uv_type'] = uvType;
    _data['uv_brand'] = uvBrand;
    _data['uv_model'] = uvModel;
    _data['uv_number'] = uvNumber;
    _data['uv_image'] = uvImage;
    _data['uv_created'] = uvCreated;
    _data['vt_name'] = vtName;
    _data['b_name'] = bName;
    _data['vm_name'] = vmName;
    return _data;
  }
}