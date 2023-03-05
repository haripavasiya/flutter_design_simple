class DealsModel {
  DealsModel({
    required this.success,
    required this.message,
    required this.offerList,
  });
  late final bool success;
  late final String message;
  late final List<OfferList> offerList;

  DealsModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    offerList = List.from(json['offer_list']).map((e)=>OfferList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['offer_list'] = offerList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class OfferList {
  OfferList({
    required this.ofId,
    required this.ofStatus,
    required this.ofType,
    required this.ofTitle,
    required this.ofDes,
    required this.ofFreeAmount,
    required this.ofSellingAmount,
    required this.ofMinAmount,
    required this.ofCreated,
  });
  late final int ofId;
  late final int ofStatus;
  late final int ofType;
  late final String ofTitle;
  late final String ofDes;
  late final int ofFreeAmount;
  late final int ofSellingAmount;
  late final int ofMinAmount;
  late final String ofCreated;

  OfferList.fromJson(Map<String, dynamic> json){
    ofId = json['of_id'];
    ofStatus = json['of_status'];
    ofType = json['of_type'];
    ofTitle = json['of_title'];
    ofDes = json['of_des'];
    ofFreeAmount = json['of_free_amount'];
    ofSellingAmount = json['of_selling_amount'];
    ofMinAmount = json['of_min_amount'];
    ofCreated = json['of_created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['of_id'] = ofId;
    _data['of_status'] = ofStatus;
    _data['of_type'] = ofType;
    _data['of_title'] = ofTitle;
    _data['of_des'] = ofDes;
    _data['of_free_amount'] = ofFreeAmount;
    _data['of_selling_amount'] = ofSellingAmount;
    _data['of_min_amount'] = ofMinAmount;
    _data['of_created'] = ofCreated;
    return _data;
  }
}