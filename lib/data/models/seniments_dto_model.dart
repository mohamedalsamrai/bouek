import 'dart:convert';

import 'package:bouek/domain/models/sentiments_model.dart';

class SenimentsDtoModel extends Sentiments {
  SenimentsDtoModel(
      super.staff,
      super.location,
      super.service,
      super.roomComforts,
      super.sleepQuality,
      super.valueForMoney,
      super.facilities,
      super.catering,
      super.pointsOfInterest);
  Sentiments toDomainModel() {
    return Sentiments(
      super.staff,
      super.location,
      super.service,
      super.roomComforts,
      super.sleepQuality,
      super.valueForMoney,
      super.facilities,
      super.catering,
      super.pointsOfInterest,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'staff': staff,
      'location': location,
      'service': service,
      'roomComforts': roomComforts,
      'sleepQuality': sleepQuality,
      'valueForMoney': valueForMoney,
      'facilities': facilities,
      'catering': catering,
      'pointsOfInterest': pointsOfInterest,
    };
  }

  factory SenimentsDtoModel.fromMap(Map<String, dynamic> map) {
    final data = map["data"][0]["sentiments"];
    return SenimentsDtoModel(
      data['staff'] as int,
      data['location'] as int,
      data['service'] as int,
      data['roomComforts'] as int,
      data['sleepQuality'] as int,
      data['valueForMoney'] as int,
      data['facilities'] as int,
      data['catering'] as int,
      data['pointsOfInterest'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SenimentsDtoModel.fromJson(source) =>
      SenimentsDtoModel.fromMap(source as Map<String, dynamic>);

  @override
  String toString() {
    return 'SenimentsDtoModel(staff: $staff, location: $location, service: $service, roomComforts: $roomComforts, sleepQuality: $sleepQuality, valueForMoney: $valueForMoney, facilities: $facilities, catering: $catering, pointsOfInterest: $pointsOfInterest)';
  }
}
