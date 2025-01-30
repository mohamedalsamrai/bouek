class AverageDtoModel {
  String? base;

  AverageDtoModel({this.base});

  AverageDtoModel.fromJson(Map<String, dynamic> json) {
    base = json['base'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    return data;
  }
}
