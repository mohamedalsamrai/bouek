import 'dart:convert';

import 'package:bouek/data/models/policies_dto_model.dart';
import 'package:bouek/data/models/price_dto_model.dart';
import 'package:bouek/data/models/room_dto_model.dart';
import 'package:bouek/domain/models/offer_model.dart';
import 'package:bouek/domain/models/policies_model.dart';

class OfferDtoModel extends Offer {
  OfferDtoModel(super.id, super.checkInDate, super.checkOutDate, super.rateCode,
      super.rateType, super.room, super.adults, super.price, super.policies);

  OfferDtoModel copyWith({
    String? id,
    String? checkInDate,
    String? checkOutDate,
    String? rateCode,
    String? rateType,
    RoomDtoModel? room,
    int? adults,
    PriceDtoModel? price,
    PoliciesDtoModel? policies,
  }) {
    return OfferDtoModel(
      id ?? this.id,
      checkInDate ?? this.checkInDate,
      checkOutDate ?? this.checkOutDate,
      rateCode ?? this.rateCode,
      rateType ?? this.rateType,
      room ?? this.room,
      adults ?? this.adults,
      price ?? this.price,
      policies ?? this.policies,
    );
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
      map['rateType'] as String,
      RoomDtoModel.fromMap(map['room'] as Map<String, dynamic>),
      map['adults'] as int,
      PriceDtoModel.fromMap(map['price'] as Map<String, dynamic>),
      PoliciesDtoModel.fromMap(map['policies'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferDtoModel.fromJson(String source) =>
      OfferDtoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfferDtoModel(id: $id, checkInDate: $checkInDate, checkOutDate: $checkOutDate, rateCode: $rateCode, rateType: $rateType, room: $room, adults: $adults, price: $price, policies: $policies)';
  }

  @override
  bool operator ==(covariant OfferDtoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.checkInDate == checkInDate &&
        other.checkOutDate == checkOutDate &&
        other.rateCode == rateCode &&
        other.rateType == rateType &&
        other.room == room &&
        other.adults == adults &&
        other.price == price &&
        other.policies == policies;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        checkInDate.hashCode ^
        checkOutDate.hashCode ^
        rateCode.hashCode ^
        rateType.hashCode ^
        room.hashCode ^
        adults.hashCode ^
        price.hashCode ^
        policies.hashCode;
  }
}
