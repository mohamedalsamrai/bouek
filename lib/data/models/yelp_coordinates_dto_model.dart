class YelpCoordinatesDtoModel {
  double? latitude;
  double? longitude;

  YelpCoordinatesDtoModel({this.latitude, this.longitude});

  YelpCoordinatesDtoModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
