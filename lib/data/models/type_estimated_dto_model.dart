class TypeEstimatedDtoModel {
  String? category;
  int? beds;
  String? bedType;

  TypeEstimatedDtoModel({this.category, this.beds, this.bedType});

  TypeEstimatedDtoModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    beds = json['beds'];
    bedType = json['bedType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['beds'] = beds;
    data['bedType'] = bedType;
    return data;
  }
}