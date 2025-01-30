import 'package:bouek/data/models/description_dto_model.dart';
import 'package:bouek/data/models/type_estimated_dto_model.dart';
import 'package:bouek/domain/models/room_model.dart';

class RoomDtoModel {
  String? type;
  TypeEstimatedDtoModel? typeEstimated;
  DescriptionDtoModel? description;

  RoomDtoModel({this.type, this.typeEstimated, this.description});

  RoomDtoModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    typeEstimated = json['typeEstimated'] != null
      ? TypeEstimatedDtoModel.fromJson(json['typeEstimated'])
      : null;
    description = json['description'] != null
      ? DescriptionDtoModel.fromJson(json['description'])
      : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (typeEstimated != null) {
      data['typeEstimated'] = typeEstimated!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    return data;
  }

  Room toDomainModel() => Room(
    type ?? '',
    typeEstimated?.category ?? '',
    typeEstimated?.beds ?? 0,
    typeEstimated?.bedType ?? '',
    description?.text ?? ''
  );
}