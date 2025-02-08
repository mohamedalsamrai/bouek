import 'package:bouek/app/presentation/di/locator_di.dart';
import 'package:bouek/app/services/api_sevices.dart';
import 'package:bouek/app/utils/methods.dart';
import 'package:bouek/data/models/hotel_dto_model.dart';
import 'package:bouek/data/models/offer_dto_model.dart';
import 'package:bouek/data/models/seniments_dto_model.dart';
import 'package:bouek/domain/models/hotel_model.dart';
import 'package:bouek/domain/models/offer_model.dart';
import 'package:bouek/domain/models/sentiments_model.dart';
import 'package:bouek/domain/usecases/get_offers_by_hotel_id_usecase.dart';
import 'package:bouek/domain/usecases/get_sentiments.dart';
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
  Future<Hotel> getHotelByHotelId(String hotelId) async {
    final data = await getHotelMap(hotelId);
    return HotelDtoModel.fromMap(data).toDomainModel();
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
  Future<List<Offer>> getOffersByHotelID(String hotelID) async {
    final Response response = await api.getOffersByHotelID(hotelID);
    final data = response.data["data"][0]["offers"] as List;
    return data
        .map(
          (e) => OfferDtoModel.fromMap(e).toDomainModel(),
        )
        .toList();
  }

  @override
  Future<Sentiments> getSentimentsByHotelId(String hotelId) async {
    final Response response = await api.getSentimentsByHotelId(hotelId);
    return SenimentsDtoModel.fromMap(response.data).toDomainModel();
  }
}
