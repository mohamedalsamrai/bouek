class RateFamilyEstimatedDtoModel {
  String? code;
  String? type;

  RateFamilyEstimatedDtoModel({this.code, this.type});

  RateFamilyEstimatedDtoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['type'] = type;
    return data;
  }
}