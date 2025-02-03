import 'dart:convert';

import 'package:bouek/data/models/offer_dto_model.dart';
import 'package:bouek/data/models/seniments_dto_model.dart';
import 'package:bouek/domain/models/hotel_model.dart';
import 'package:bouek/domain/models/offer_model.dart';
import 'package:bouek/domain/models/sentiments_model.dart';
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
    super.rating,
    super.lastUpdate,
  );

  Hotel toDomainModel() {
    return Hotel(
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
      super.rating,
      super.lastUpdate,
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
      'rating': rating,
      'lastUpdate': lastUpdate,
    };
  }

  factory HotelDtoModel.fromMap(Map<String, dynamic> map) {
    return HotelDtoModel(
      map['hotelId'] as String,
      map['name'] as String,
      map['imageUrl'] = '',
      map['chainCode'] as String,
      map['cityCode'] as String,
      map['latitude'] as double,
      map['longitude'] as double,
      map['overallRating'] as int,
      map['numberOfReviews'] as int,
      map['numberOfRatings'] as int,
      map["sentiments"] as Sentiments,
      map['offers'] as List<Offer>,
      map['available'] as bool,
      map['countryCode'] as String,
      map['rating'] as double,
      map['lastUpdate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HotelDtoModel.fromJson(String source) =>
      HotelDtoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
