class YelpOpenDtoModel {
  bool? isOvernight;
  String? start;
  String? end;
  int? day;

  YelpOpenDtoModel({this.isOvernight, this.start, this.end, this.day});

  YelpOpenDtoModel.fromJson(Map<String, dynamic> json) {
    isOvernight = json['is_overnight'];
    start = json['start'];
    end = json['end'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_overnight'] = isOvernight;
    data['start'] = start;
    data['end'] = end;
    data['day'] = day;
    return data;
  }
}