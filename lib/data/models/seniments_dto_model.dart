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
      super.pointsOfInterest,
      super.overallRating,
      super.numberOfReviews,
      super.numberOfRatings);
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
        super.overallRating,
        super.numberOfReviews,
        super.numberOfRatings);
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
      'overallRating': overallRating,
      'numberOfReviews': numberOfReviews,
      'numberOfRatings': numberOfRatings
    };
  }

  factory SenimentsDtoModel.fromMap(Map<String, dynamic> map) {
    final sentimentsData = map["data"][0]["sentiments"];

    return SenimentsDtoModel(
        sentimentsData['staff'] as int,
        sentimentsData['location'] as int,
        sentimentsData['service'] as int,
        sentimentsData['roomComforts'] as int,
        sentimentsData['sleepQuality'] as int,
        sentimentsData['valueForMoney'] as int,
        sentimentsData['facilities'] as int,
        sentimentsData['catering'] as int,
        sentimentsData['pointsOfInterest'] as int,
        map["data"][0]["overallRating"] as int,
        map["data"][0]["numberOfReviews"] as int,
        map["data"][0]["numberOfRatings"] as int);
  }

  String toJson() => json.encode(toMap());

  factory SenimentsDtoModel.fromJson(source) =>
      SenimentsDtoModel.fromMap(source as Map<String, dynamic>);

  @override
  String toString() {
    return 'SenimentsDtoModel(staff: $staff, location: $location, service: $service, roomComforts: $roomComforts, sleepQuality: $sleepQuality, valueForMoney: $valueForMoney, facilities: $facilities, catering: $catering, pointsOfInterest: $pointsOfInterest)';
  }
}
