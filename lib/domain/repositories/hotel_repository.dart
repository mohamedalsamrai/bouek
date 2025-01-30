import 'package:bouek/domain/models/hotel_model.dart';

abstract class HotelRepository {
  Future<List<Hotel>> getHotelsByGeocode(double latitude, double longitude);
  Future<List<Hotel>> getHotelsByCityCode(String cityCode);
  Future<Hotel> getHotelByHotelId(String hotelId);
}
