import 'dart:convert';

import 'package:bouek/data/models/policies_dto_model.dart';
import 'package:bouek/data/models/price_dto_model.dart';
import 'package:bouek/data/models/room_dto_model.dart';
import 'package:bouek/domain/models/offer_model.dart';

class OfferDtoModel extends Offer {
  OfferDtoModel(super.id, super.checkInDate, super.checkOutDate, super.rateCode,
      super.rateType, super.room, super.adults, super.price, super.policies);

  Offer toDomainModel() {
    return Offer(
        super.id,
        super.checkInDate,
        super.checkOutDate,
        super.rateCode,
        super.rateType,
        super.room,
        super.adults,
        super.price,
        super.policies);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate,
      'rateCode': rateCode,
      'rateType': rateType,
      'room': (room as RoomDtoModel).toMap(),
      'adults': adults,
      'price': (price as PriceDtoModel).toMap(),
      'policies': (policies as PoliciesDtoModel).toMap(),
    };
  }

  factory OfferDtoModel.fromMap(Map<String, dynamic> map) {
    return OfferDtoModel(
      map['id'] as String,
      map['checkInDate'] as String,
      map['checkOutDate'] as String,
      map['rateCode'] as String,
      map['rateType'] = "u",
      RoomDtoModel.fromMap(map['room'] as Map<String, dynamic>),
      map['guests']['adults'] as int,
      PriceDtoModel.fromMap(map['price'] as Map<String, dynamic>),
      PoliciesDtoModel.fromMap(map['policies'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferDtoModel.fromJson(source) =>
      OfferDtoModel.fromMap(source as Map<String, dynamic>);
}
