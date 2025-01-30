import 'package:bouek/data/datasources/network_datasource.dart';
import 'package:bouek/domain/models/hotel_model.dart';
import 'package:bouek/domain/repositories/hotel_repository.dart';

class HotelRepositoryImpl extends HotelRepository {
  final NetworkDatasource networkDatasource;

  HotelRepositoryImpl(this.networkDatasource);

  @override
  Future<Hotel> getHotelByHotelId(String hotelId) {
    return networkDatasource.getHotelByHotelId(hotelId);
  }

  @override
  Future<List<Hotel>> getHotelsByCityCode(String cityCode) {
    return networkDatasource.getHotelsByCityCode(cityCode);
  }

  @override
  Future<List<Hotel>> getHotelsByGeocode(double latitude, double longitude) {
    return networkDatasource.getHotelsByGeocode(latitude, longitude);
  }
}