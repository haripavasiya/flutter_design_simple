class WalletDetailsModel {
  WalletDetailsModel({
    required this.success,
    required this.message,
    required this.walletDetail,
  });
  late final bool success;
  late final String message;
  late final List<WalletDetail> walletDetail;

  WalletDetailsModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    walletDetail = List.from(json['wallet_detail']).map((e)=>WalletDetail.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['wallet_detail'] = walletDetail.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class WalletDetail {
  WalletDetail({
    required this.walletDetailId,
    required this.userId,
    required this.type,
    required this.amount,
    required this.transId,
    required this.message,
    required this.detailCreated,
  });
  late final int walletDetailId;
  late final int userId;
  late final int type;
  late final int amount;
  late final String transId;
  late final String message;
  late final String detailCreated;

  WalletDetail.fromJson(Map<String, dynamic> json){
    walletDetailId = json['wallet_detail_id'];
    userId = json['user_id'];
    type = json['type'];
    amount = json['amount'];
    transId = json['trans_id'];
    message = json['message'];
    detailCreated = json['detail_created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['wallet_detail_id'] = walletDetailId;
    _data['user_id'] = userId;
    _data['type'] = type;
    _data['amount'] = amount;
    _data['trans_id'] = transId;
    _data['message'] = message;
    _data['detail_created'] = detailCreated;
    return _data;
  }
}