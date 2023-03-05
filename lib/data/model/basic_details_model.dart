class BasicDetailsModel {
  BasicDetailsModel({
    required this.data,
  });
  late final Data data;

  BasicDetailsModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.pageSetup,
    required this.category,
    required this.brand,
    required this.type,
  });
  late final PageSetup pageSetup;
  late final Category category;
  late final Brand brand;
  late final Type type;

  Data.fromJson(Map<String, dynamic> json){
    pageSetup = PageSetup.fromJson(json['page_setup']);
    category = Category.fromJson(json['category']);
    brand = Brand.fromJson(json['brand']);
    type = Type.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page_setup'] = pageSetup.toJson();
    _data['category'] = category.toJson();
    _data['brand'] = brand.toJson();
    _data['type'] = type.toJson();
    return _data;
  }
}

class PageSetup {
  PageSetup({
    required this.id,
    required this.contactMobile,
    required this.contactEmail,
    required this.tc,
    required this.privacyPolicy,
    required this.about,
    required this.userKey,
  });
  late final int id;
  late final int contactMobile;
  late final String contactEmail;
  late final String tc;
  late final String privacyPolicy;
  late final String about;
  late final String userKey;

  PageSetup.fromJson(Map<String, dynamic> json){
    id = json['id'];
    contactMobile = json['contact_mobile'];
    contactEmail = json['contact_email'];
    tc = json['tc'];
    privacyPolicy = json['privacy_policy'];
    about = json['about'];
    userKey = json['user_key'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['contact_mobile'] = contactMobile;
    _data['contact_email'] = contactEmail;
    _data['tc'] = tc;
    _data['privacy_policy'] = privacyPolicy;
    _data['about'] = about;
    _data['user_key'] = userKey;
    return _data;
  }
}

class Category {
  Category({
    required this.clist,
    required this.success,
    required this.message,
  });
  late final List<Clist> clist;
  late final bool success;
  late final String message;

  Category.fromJson(Map<String, dynamic> json){
    clist = List.from(json['clist']).map((e)=>Clist.fromJson(e)).toList();
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['clist'] = clist.map((e)=>e.toJson()).toList();
    _data['success'] = success;
    _data['message'] = message;
    return _data;
  }
}

class Clist {
  Clist({
    required this.catId,
    required this.catStatus,
    required this.catName,
    required this.catDescription,
    required this.catImage,
    required this.catCreated,
  });
  late final int catId;
  late final int catStatus;
  late final String catName;
  late final String catDescription;
  late final String catImage;
  late final String catCreated;

  Clist.fromJson(Map<String, dynamic> json){
    catId = json['cat_id'];
    catStatus = json['cat_status'];
    catName = json['cat_name'];
    catDescription = json['cat_description'];
    catImage = json['cat_image'];
    catCreated = json['cat_created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cat_id'] = catId;
    _data['cat_status'] = catStatus;
    _data['cat_name'] = catName;
    _data['cat_description'] = catDescription;
    _data['cat_image'] = catImage;
    _data['cat_created'] = catCreated;
    return _data;
  }
}

class Brand {
  Brand({
    required this.blist,
    required this.success,
    required this.message,
  });
  late final List<Blist> blist;
  late final bool success;
  late final String message;

  Brand.fromJson(Map<String, dynamic> json){
    blist = List.from(json['blist']).map((e)=>Blist.fromJson(e)).toList();
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['blist'] = blist.map((e)=>e.toJson()).toList();
    _data['success'] = success;
    _data['message'] = message;
    return _data;
  }
}

class Blist {
  Blist({
    required this.bId,
    required this.vehicale_type,
    required this.bStatus,
    required this.bName,
    required this.bCreated,
  });
  late final int bId;
  late final int vehicale_type;
  late final int bStatus;
  late final String bName;
  late final String bCreated;

  Blist.fromJson(Map<String, dynamic> json){
    bId = json['b_id'];
    vehicale_type = json['vehicale_type'];
    bStatus = json['b_status'];
    bName = json['b_name'];
    bCreated = json['b_created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['b_id'] = bId;
    _data['vehicale_type'] = vehicale_type;
    _data['b_status'] = bStatus;
    _data['b_name'] = bName;
    _data['b_created'] = bCreated;
    return _data;
  }
}

class Type {
  Type({
    required this.tlist,
    required this.success,
    required this.message,
  });
  late final List<Tlist> tlist;
  late final bool success;
  late final String message;

  Type.fromJson(Map<String, dynamic> json){
    tlist = List.from(json['tlist']).map((e)=>Tlist.fromJson(e)).toList();
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tlist'] = tlist.map((e)=>e.toJson()).toList();
    _data['success'] = success;
    _data['message'] = message;
    return _data;
  }
}

class Tlist {
  Tlist({
    required this.vtId,
    required this.vtStatus,
    required this.vtName,
    required this.vtImage,
  });
  late final int vtId;
  late final int vtStatus;
  late final String vtName;
  late final String vtImage;

  Tlist.fromJson(Map<String, dynamic> json){
    vtId = json['vt_id'];
    vtStatus = json['vt_status'];
    vtName = json['vt_name'];
    vtImage = json['vt_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['vt_id'] = vtId;
    _data['vt_status'] = vtStatus;
    _data['vt_name'] = vtName;
    _data['vt_image'] = vtImage;
    return _data;
  }
}