import 'package:bouek/domain/models/policies_model.dart';
import 'package:bouek/domain/models/price_model.dart';
import 'package:bouek/domain/models/room_model.dart';

class Offer {
  final String id;
  final String checkInDate;
  final String checkOutDate;
  final String rateCode;
  final String rateType;
  final Room room;
  final int adults;
  final Price price;
  final Policies policies;

  Offer(
    this.id,
    this.checkInDate,
    this.checkOutDate,
    this.rateCode,
    this.rateType,
    this.room,
    this.adults,
    this.price,
    this.policies,
  );       
}
