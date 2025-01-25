import 'package:bouek/domain/models/hotel_model.dart';
import 'package:bouek/domain/repositories/hotel_repository.dart';

class GetHotelsByGeocodeUsecase {
  final HotelRepository _hotelRepository;

  GetHotelsByGeocodeUsecase(this._hotelRepository);

  Future<List<Hotel>> call(double latitude, double longitude) async {
    return _hotelRepository.getHotelsByGeocode(latitude: latitude, longitude: longitude);
  }
}