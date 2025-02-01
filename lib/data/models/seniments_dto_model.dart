import 'dart:convert';

import 'package:bouek/domain/models/sentiments_model.dart';

class SenimentsDtoModel extends Sentiments {
  SenimentsDtoModel(
      super.staff,
      super.location,
      super.service,
      super.roomComforts,
      super.sleepQuality,
      super.swimmingPool,
      super.valueForMoney,
      super.facilities,
      super.catering,
      super.pointsOfInterest);
       SenimentsDtoModel copyWith({
    int? staff,
    int? location,
    int? service,
    int? roomComforts,
    int? sleepQuality,
    int? swimmingPool,
    int? valueForMoney,
    int? facilities,
    int? catering,
    int? pointsOfInterest,
  }) {
    return SenimentsDtoModel(
      staff ?? this.staff,
      location ?? this.location,
      service ?? this.service,
      roomComforts ?? this.roomComforts,
      sleepQuality ?? this.sleepQuality,
      swimmingPool ?? this.swimmingPool,
      valueForMoney ?? this.valueForMoney,
      facilities ?? this.facilities,
      catering ?? this.catering,
      pointsOfInterest ?? this.pointsOfInterest,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'staff': staff,
      'location': location,
      'service': service,
      'roomComforts': roomComforts,
      'sleepQuality': sleepQuality,
      'swimmingPool': swimmingPool,
      'valueForMoney': valueForMoney,
      'facilities': facilities,
      'catering': catering,
      'pointsOfInterest': pointsOfInterest,
    };
  }

  factory SenimentsDtoModel.fromMap(Map<String, dynamic> map) {
    return SenimentsDtoModel(
      map['staff'] as int,
      map['location'] as int,
      map['service'] as int,
      map['roomComforts'] as int,
      map['sleepQuality'] as int,
      map['swimmingPool'] as int,
      map['valueForMoney'] as int,
      map['facilities'] as int,
      map['catering'] as int,
      map['pointsOfInterest'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SenimentsDtoModel.fromJson(String source) => SenimentsDtoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SenimentsDtoModel(staff: $staff, location: $location, service: $service, roomComforts: $roomComforts, sleepQuality: $sleepQuality, swimmingPool: $swimmingPool, valueForMoney: $valueForMoney, facilities: $facilities, catering: $catering, pointsOfInterest: $pointsOfInterest)';
  }

  @override
  bool operator ==(covariant SenimentsDtoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.staff == staff &&
      other.location == location &&
      other.service == service &&
      other.roomComforts == roomComforts &&
      other.sleepQuality == sleepQuality &&
      other.swimmingPool == swimmingPool &&
      other.valueForMoney == valueForMoney &&
      other.facilities == facilities &&
      other.catering == catering &&
      other.pointsOfInterest == pointsOfInterest;
  }

  @override
  int get hashCode {
    return staff.hashCode ^
      location.hashCode ^
      service.hashCode ^
      roomComforts.hashCode ^
      sleepQuality.hashCode ^
      swimmingPool.hashCode ^
      valueForMoney.hashCode ^
      facilities.hashCode ^
      catering.hashCode ^
      pointsOfInterest.hashCode;
  }
}
