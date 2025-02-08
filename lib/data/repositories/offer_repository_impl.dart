import 'package:bouek/data/datasources/network_datasource.dart';
import 'package:bouek/domain/models/offer_model.dart';
import 'package:bouek/domain/repositories/offer_repository.dart';

class OfferRepositoryImpl extends OfferRepository {
  final NetworkDatasource networkDatasource;

  OfferRepositoryImpl(this.networkDatasource);

  @override
  Future<List<Offer>> getOffersByHotelID(String hotelID) {
    return networkDatasource.getOffersByHotelID(hotelID);
  }
}