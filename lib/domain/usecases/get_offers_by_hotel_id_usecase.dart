import 'package:bouek/domain/models/offer_model.dart';
import 'package:bouek/domain/repositories/offer_repository.dart';

class GetOffersByHotelIdUsecase {
  final OfferRepository _offerRepository;

  GetOffersByHotelIdUsecase(this._offerRepository);

  Future<List<Offer>> call(String hotelId) {
    return _offerRepository.getOffersByHotelID(hotelID: hotelId);
  }
}