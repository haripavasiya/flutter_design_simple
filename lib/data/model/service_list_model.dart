class ServiceModel {
  ServiceModel({
    required this.success,
    required this.message,
    required this.serviceList,
  });
  late final bool success;
  late final String message;
  late final List<ServiceList> serviceList;

  ServiceModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    serviceList = List.from(json['service_list']).map((e)=>ServiceList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['service_list'] = serviceList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ServiceList {
  ServiceList({
    required this.sId,
    required this.sStatus,
    required this.catId,
    required this.sTitle,
    required this.sTime,
    required this.sDes,
    required this.sPrice,
  });
  late final int sId;
  late final int sStatus;
  late final int catId;
  late final String sTitle;
  late final String sTime;
  late final String sDes;
  late final String sPrice;

  ServiceList.fromJson(Map<String, dynamic> json){
    sId = json['s_id'];
    sStatus = json['s_status'];
    catId = json['cat_id'];
    sTitle = json['s_title'];
    sTime = json['s_time'];
    sDes = json['s_des'];
    sPrice = json['s_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['s_id'] = sId;
    _data['s_status'] = sStatus;
    _data['cat_id'] = catId;
    _data['s_title'] = sTitle;
    _data['s_time'] = sTime;
    _data['s_des'] = sDes;
    _data['s_price'] = sPrice;
    return _data;
  }
}