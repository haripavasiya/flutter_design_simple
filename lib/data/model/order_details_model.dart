class OrderDetailsModel {
  OrderDetailsModel({
    required this.success,
    required this.message,
    required this.orderDetail,
  });
  late final bool success;
  late final String message;
  late final OrderDetail orderDetail;

  OrderDetailsModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    orderDetail = OrderDetail.fromJson(json['order_detail']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['order_detail'] = orderDetail.toJson();
    return _data;
  }
}

class OrderDetail {
  OrderDetail({
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
    required this.cancel_reason,
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
    required this.catName,
    required this.sTitle,
    required this.vtName,
    required this.bName,
    required this.vmName,
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
  late final String cancel_reason;
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
  late final String catName;
  late final String sTitle;
  late final String vtName;
  late final String bName;
  late final String vmName;

  OrderDetail.fromJson(Map<String, dynamic> json){
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
    cancel_reason = json['cancel_reason'];
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
    catName = json['cat_name'];
    sTitle = json['s_title'];
    vtName = json['vt_name'];
    bName = json['b_name'];
    vmName = json['vm_name'];
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
    _data['cancel_reason'] = cancel_reason;
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
    _data['cat_name'] = catName;
    _data['s_title'] = sTitle;
    _data['vt_name'] = vtName;
    _data['b_name'] = bName;
    _data['vm_name'] = vmName;
    return _data;
  }
}