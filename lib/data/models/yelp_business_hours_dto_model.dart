import 'package:bouek/data/models/yelp_open_dto_model.dart';

class YelpBusinessHoursDtoModel {
  List<YelpOpenDtoModel>? open;
  String? hoursType;
  bool? isOpenNow;

  YelpBusinessHoursDtoModel({this.open, this.hoursType, this.isOpenNow});

  YelpBusinessHoursDtoModel.fromJson(Map<String, dynamic> json) {
    if (json['open'] != null) {
      open = <YelpOpenDtoModel>[];
      json['open'].forEach((v) {
        open!.add(YelpOpenDtoModel.fromJson(v));
      });
    }
    hoursType = json['hours_type'];
    isOpenNow = json['is_open_now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (open != null) {
      data['open'] = open!.map((v) => v.toJson()).toList();
    }
    data['hours_type'] = hoursType;
    data['is_open_now'] = isOpenNow;
    return data;
  }
}