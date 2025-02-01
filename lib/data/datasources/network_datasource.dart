import 'package:bouek/app/services/api_sevices.dart';
import 'package:bouek/data/models/seniments_dto_model.dart';
import 'package:bouek/domain/models/hotel_model.dart';
import 'package:bouek/domain/models/offer_model.dart';
import 'package:bouek/domain/models/sentiments_model.dart';
import 'package:dio/dio.dart';

abstract class NetworkDatasource {
  Future<List<Hotel>> getHotelsByGeocode(double latitude, double longitude);
  Future<List<Hotel>> getHotelsByCityCode(String cityCode);
  Future<Hotel> getHotelByHotelId(String hotelId);

  Future<List<Offer>> getOffersByHotelID(String hotelID);

  Future<Sentiments> getSentimentsByHotelId(String hotelId);
}

class NetworkDatasourceImpl extends NetworkDatasource {
  final ApiSevices api;
  NetworkDatasourceImpl(this.api);
  @override
  Future<Hotel> getHotelByHotelId(String hotelId) {
    // TODO: implement getHotelByHotelId
    throw UnimplementedError();
  }

  @override
  Future<List<Hotel>> getHotelsByCityCode(String cityCode) {
    // TODO: implement getHotelsByCityCode
    throw UnimplementedError();
  }

  @override
  Future<List<Hotel>> getHotelsByGeocode(double latitude, double longitude) {
    // TODO: implement getHotelsByGeocode
    throw UnimplementedError();
  }

  @override
  Future<List<Offer>> getOffersByHotelID(String hotelID) {
    // TODO: implement getOffersByHotelID
    throw UnimplementedError();
  }

  @override
  Future<Sentiments> getSentimentsByHotelId(String hotelId) async {
    final Response response = await api.getSentimentsByHotelId(hotelId);
    return SenimentsDtoModel.fromJson(response.data).toDomainModel();
  }
}
