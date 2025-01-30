import 'package:bouek/data/models/description_dto_model.dart';

class CancellationDtoModel {
  DescriptionDtoModel? description;
  String? type;

  CancellationDtoModel({this.description, this.type});

  CancellationDtoModel.fromJson(Map<String, dynamic> json) {
    description = json['description'] != null
        ? DescriptionDtoModel.fromJson(json['description'])
        : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['type'] = type;
    return data;
  }
}