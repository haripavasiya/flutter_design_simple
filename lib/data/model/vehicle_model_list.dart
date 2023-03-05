class VehicleModelList {
  VehicleModelList({
    required this.success,
    required this.Message,
    required this.vehicleModelsList,
  });
  late final bool success;
  late final String Message;
  late final List<ModelsList> vehicleModelsList;

  VehicleModelList.fromJson(Map<String, dynamic> json){
    success = json['success'];
    Message = json['Message'];
    vehicleModelsList = List.from(json['vehicle_models_list']).map((e)=>ModelsList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['Message'] = Message;
    _data['vehicle_models_list'] = vehicleModelsList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ModelsList {
  ModelsList({
    required this.vmId,
    required this.vmStatus,
    required this.brandId,
    required this.vmName,
  });
  late final int vmId;
  late final int vmStatus;
  late final int brandId;
  late final String vmName;

  ModelsList.fromJson(Map<String, dynamic> json){
    vmId = json['vm_id'];
    vmStatus = json['vm_status'];
    brandId = json['brand_id'];
    vmName = json['vm_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['vm_id'] = vmId;
    _data['vm_status'] = vmStatus;
    _data['brand_id'] = brandId;
    _data['vm_name'] = vmName;
    return _data;
  }
}