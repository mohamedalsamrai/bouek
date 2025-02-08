import 'package:bouek/domain/models/offer_model.dart';

abstract class OfferRepository {
  Future<List<Offer>> getOffersByHotelID(String hotelID);
}