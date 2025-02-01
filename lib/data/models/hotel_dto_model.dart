import 'dart:convert';

import 'package:bouek/data/models/offer_dto_model.dart';
import 'package:bouek/data/models/seniments_dto_model.dart';
import 'package:bouek/domain/models/hotel_model.dart';
import 'package:flutter/foundation.dart';

class HotelDtoModel extends Hotel {
  HotelDtoModel(
      super.hotelId,
      super.name,
      super.imageUrl,
      super.chainCode,
      super.cityCode,
      super.latitude,
      super.longitude,
      super.overallRating,
      super.numberOfReviews,
      super.numberOfRatings,
      super.sentiments,
      super.offers,
      super.available,
      super.countryCode,
      super.distanceValue,
      super.distanceUnit,
      super.amenities,
      super.rating,
      super.lastUpdate,
      super.selfLink);

  Hotel copyWith({
    String? hotelId,
    String? name,
    String? imageUrl,
    String? chainCode,
    String? cityCode,
    double? latitude,
    double? longitude,
    double? overallRating,
    int? numberOfReviews,
    int? numberOfRatings,
    SenimentsDtoModel? sentiments,
    List<OfferDtoModel>? offers,
    bool? available,
    String? countryCode,
    double? distanceValue,
    String? distanceUnit,
    List<String>? amenities,
    int? rating,
    String? lastUpdate,
    String? selfLink,
  }) {
    return Hotel(
      hotelId ?? this.hotelId,
      name ?? this.name,
      imageUrl ?? this.imageUrl,
      chainCode ?? this.chainCode,
      cityCode ?? this.cityCode,
      latitude ?? this.latitude,
      longitude ?? this.longitude,
      overallRating ?? this.overallRating,
      numberOfReviews ?? this.numberOfReviews,
      numberOfRatings ?? this.numberOfRatings,
      sentiments ?? this.sentiments,
      offers ?? this.offers,
      available ?? this.available,
      countryCode ?? this.countryCode,
      distanceValue ?? this.distanceValue,
      distanceUnit ?? this.distanceUnit,
      amenities ?? this.amenities,
      rating ?? this.rating,
      lastUpdate ?? this.lastUpdate,
      selfLink ?? this.selfLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hotelId': hotelId,
      'name': name,
      'imageUrl': imageUrl,
      'chainCode': chainCode,
      'cityCode': cityCode,
      'latitude': latitude,
      'longitude': longitude,
      'overallRating': overallRating,
      'numberOfReviews': numberOfReviews,
      'numberOfRatings': numberOfRatings,
      'sentiments': (sentiments as SenimentsDtoModel).toMap(),
      'offers': offers.map((x) => (x as OfferDtoModel).toMap()).toList(),
      'available': available,
      'countryCode': countryCode,
      'distanceValue': distanceValue,
      'distanceUnit': distanceUnit,
      'amenities': amenities,
      'rating': rating,
      'lastUpdate': lastUpdate,
      'selfLink': selfLink,
    };
  }

  factory HotelDtoModel.fromMap(Map<String, dynamic> map) {
    return HotelDtoModel(
      map['hotelId'] as String,
      map['name'] as String,
      map['imageUrl'] as String,
      map['chainCode'] as String,
      map['cityCode'] as String,
      map['latitude'] as double,
      map['longitude'] as double,
      map['overallRating'] as double,
      map['numberOfReviews'] as int,
      map['numberOfRatings'] as int,
      SenimentsDtoModel.fromMap(map['sentiments'] as Map<String, dynamic>),
      List<OfferDtoModel>.from(
        (map['offers'] as List<int>).map<OfferDtoModel>(
          (x) => OfferDtoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      map['available'] as bool,
      map['countryCode'] as String,
      map['distanceValue'] as double,
      map['distanceUnit'] as String,
      List<String>.from(map['amenities'] as List<String>),
      map['rating'] as int,
      map['lastUpdate'] as String,
      map['selfLink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelDtoModel.fromJson(String source) =>
      HotelDtoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hotel(hotelId: $hotelId, name: $name, imageUrl: $imageUrl, chainCode: $chainCode, cityCode: $cityCode, latitude: $latitude, longitude: $longitude, overallRating: $overallRating, numberOfReviews: $numberOfReviews, numberOfRatings: $numberOfRatings, sentiments: $sentiments, offers: $offers, available: $available, countryCode: $countryCode, distanceValue: $distanceValue, distanceUnit: $distanceUnit, amenities: $amenities, rating: $rating, lastUpdate: $lastUpdate, selfLink: $selfLink)';
  }

  @override
  bool operator ==(covariant HotelDtoModel other) {
    if (identical(this, other)) return true;

    return other.hotelId == hotelId &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.chainCode == chainCode &&
        other.cityCode == cityCode &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.overallRating == overallRating &&
        other.numberOfReviews == numberOfReviews &&
        other.numberOfRatings == numberOfRatings &&
        other.sentiments == sentiments &&
        listEquals(other.offers, offers) &&
        other.available == available &&
        other.countryCode == countryCode &&
        other.distanceValue == distanceValue &&
        other.distanceUnit == distanceUnit &&
        listEquals(other.amenities, amenities) &&
        other.rating == rating &&
        other.lastUpdate == lastUpdate &&
        other.selfLink == selfLink;
  }

  @override
  int get hashCode {
    return hotelId.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        chainCode.hashCode ^
        cityCode.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        overallRating.hashCode ^
        numberOfReviews.hashCode ^
        numberOfRatings.hashCode ^
        sentiments.hashCode ^
        offers.hashCode ^
        available.hashCode ^
        countryCode.hashCode ^
        distanceValue.hashCode ^
        distanceUnit.hashCode ^
        amenities.hashCode ^
        rating.hashCode ^
        lastUpdate.hashCode ^
        selfLink.hashCode;
  }
}
