class ChangesDtoModel {
  String? startDate;
  String? endDate;
  String? total;

  ChangesDtoModel({this.startDate, this.endDate, this.total});

  ChangesDtoModel.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    endDate = json['endDate'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['total'] = total;
    return data;
  }
}
