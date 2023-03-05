class OrderModel {
  OrderModel({
    required this.success,
    required this.message,
    required this.myOrderList,
  });
  late final bool success;
  late final String message;
  late final List<MyOrderList> myOrderList;

  OrderModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    myOrderList = List.from(json['my_order_list']).map((e)=>MyOrderList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['my_order_list'] = myOrderList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MyOrderList {
  MyOrderList({
    required this.placeOrderId,
    required this.orderStatus,
    required this.type,
    required this.orderNo,
    required this.userId,
    required this.userName,
    required this.userMobile,
    required this.categoryId,
    required this.serviceId,
    required this.scheduleDate,
    required this.scheduleTime,
    required this.addressTitle,
    required this.lat,
    required this.lng,
    required this.gpsAddress,
    required this.placeOrderAt,
    required this.uType,
    required this.uBrand,
    required this.uvModel,
    required this.uvNumber,
    required this.promoCoode,
    required this.discountAmount,
    required this.totalAmount,
    required this.grantTotal,
  });
  late final int placeOrderId;
  late final int orderStatus;
  late final int type;
  late final String orderNo;
  late final int userId;
  late final String userName;
  late final String userMobile;
  late final int categoryId;
  late final int serviceId;
  late final String scheduleDate;
  late final String scheduleTime;
  late final String addressTitle;
  late final String lat;
  late final String lng;
  late final String gpsAddress;
  late final String placeOrderAt;
  late final int uType;
  late final int uBrand;
  late final int uvModel;
  late final String uvNumber;
  late final String promoCoode;
  late final String discountAmount;
  late final String totalAmount;
  late final String grantTotal;

  MyOrderList.fromJson(Map<String, dynamic> json){
    placeOrderId = json['place_order_id'];
    orderStatus = json['order_status'];
    type = json['type'];
    orderNo = json['order_no'];
    userId = json['user_id'];
    userName = json['user_name'];
    userMobile = json['user_mobile'];
    categoryId = json['category_id'];
    serviceId = json['service_id'];
    scheduleDate = json['schedule_date'];
    scheduleTime = json['schedule_time'];
    addressTitle = json['address_title'];
    lat = json['lat'];
    lng = json['lng'];
    gpsAddress = json['gps_address'];
    placeOrderAt = json['place_order_at'];
    uType = json['u_type'];
    uBrand = json['u_brand'];
    uvModel = json['uv_model'];
    uvNumber = json['uv_number'];
    promoCoode = json['promo_coode'];
    discountAmount = json['discount_amount'];
    totalAmount = json['total_amount'];
    grantTotal = json['grant_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['place_order_id'] = placeOrderId;
    _data['order_status'] = orderStatus;
    _data['type'] = type;
    _data['order_no'] = orderNo;
    _data['user_id'] = userId;
    _data['user_name'] = userName;
    _data['user_mobile'] = userMobile;
    _data['category_id'] = categoryId;
    _data['service_id'] = serviceId;
    _data['schedule_date'] = scheduleDate;
    _data['schedule_time'] = scheduleTime;
    _data['address_title'] = addressTitle;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['gps_address'] = gpsAddress;
    _data['place_order_at'] = placeOrderAt;
    _data['u_type'] = uType;
    _data['u_brand'] = uBrand;
    _data['uv_model'] = uvModel;
    _data['uv_number'] = uvNumber;
    _data['promo_coode'] = promoCoode;
    _data['discount_amount'] = discountAmount;
    _data['total_amount'] = totalAmount;
    _data['grant_total'] = grantTotal;
    return _data;
  }
}