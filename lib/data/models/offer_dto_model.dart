import 'package:bouek/data/models/guests_dto_model.dart';
import 'package:bouek/data/models/policies_dto_model.dart';
import 'package:bouek/data/models/price_dto_model.dart';
import 'package:bouek/data/models/rate_family_estimated_dto_model.dart';
import 'package:bouek/data/models/room_dto_model.dart';
import 'package:bouek/domain/models/offer_model.dart';
import 'package:bouek/domain/models/policies_model.dart';
import 'package:bouek/domain/models/price_model.dart';
import 'package:bouek/domain/models/room_model.dart';

class OfferDtoModel {
  String? id;
  String? checkInDate;
  String? checkOutDate;
  String? rateCode;
  RateFamilyEstimatedDtoModel? rateFamilyEstimated;
  RoomDtoModel? room;
  GuestsDtoModel? guests;
  PriceDtoModel? price;
  PoliciesDtoModel? policies;
  String? self;

  OfferDtoModel(
    {
      this.id,
      this.checkInDate,
      this.checkOutDate,
      this.rateCode,
      this.rateFamilyEstimated,
      this.room,
      this.guests,
      this.price,
      this.policies,
      this.self
    }
  );

  OfferDtoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    checkInDate = json['checkInDate'];
    checkOutDate = json['checkOutDate'];
    rateCode = json['rateCode'];
    rateFamilyEstimated = json['rateFamilyEstimated'] != null
      ? RateFamilyEstimatedDtoModel.fromJson(json['rateFamilyEstimated'])
      : null;
    room = json['room'] != null ? RoomDtoModel.fromJson(json['room']) : null;
    guests =
    json['guests'] != null ? GuestsDtoModel.fromJson(json['guests']) : null;
    price = json['price'] != null ? PriceDtoModel.fromJson(json['price']) : null;
    policies = json['policies'] != null
      ? PoliciesDtoModel.fromJson(json['policies'])
      : null;
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['checkInDate'] = checkInDate;
    data['checkOutDate'] = checkOutDate;
    data['rateCode'] = rateCode;
    if (rateFamilyEstimated != null) {
      data['rateFamilyEstimated'] = rateFamilyEstimated!.toJson();
    }
    if (room != null) {
      data['room'] = room!.toJson();
    }
    if (guests != null) {
      data['guests'] = guests!.toJson();
    }
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (policies != null) {
      data['policies'] = policies!.toJson();
    }
    data['self'] = self;
    return data;
  }

  Offer toDomainModel() => Offer(
    id ?? '',
    checkInDate ?? '',
    checkOutDate ?? '',
    rateCode ?? '',
    rateFamilyEstimated?.type ?? '',
    room?.toDomainModel() ?? Room('', '', 0, '', ''),
    guests?.adults ?? 0,
    price?.toDomainModel() ?? Price('', '', ''),
    policies?.toDomainModel() ?? Policies('', '', false)
  );
}







