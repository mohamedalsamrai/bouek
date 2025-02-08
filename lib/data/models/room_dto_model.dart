import 'dart:convert';

import 'package:bouek/domain/models/room_model.dart';

class RoomDtoModel extends Room {
  RoomDtoModel(
      super.type, super.category, super.beds, super.bedType, super.description);
  RoomDtoModel copyWith({
    String? type,
    String? category,
    int? beds,
    String? bedType,
    String? description,
  }) {
    return RoomDtoModel(
      type ?? this.type,
      category ?? this.category,
      beds ?? this.beds,
      bedType ?? this.bedType,
      description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'category': category,
      'beds': beds,
      'bedType': bedType,
      'description': description,
    };
  }

  factory RoomDtoModel.fromMap(Map<String, dynamic> map) {
    return RoomDtoModel(
      map['type'] as String,
      map['typeEstimated']['category'] as String,
      map['typeEstimated']['beds'] as int,
      map['typeEstimated']['bedType'] as String,
      map['description']['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomDtoModel.fromJson(String source) =>
      RoomDtoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoomDtoModel(type: $type, category: $category, beds: $beds, bedType: $bedType, description: $description)';
  }

  @override
  bool operator ==(covariant RoomDtoModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.category == category &&
        other.beds == beds &&
        other.bedType == bedType &&
        other.description == description;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        category.hashCode ^
        beds.hashCode ^
        bedType.hashCode ^
        description.hashCode;
  }
}
