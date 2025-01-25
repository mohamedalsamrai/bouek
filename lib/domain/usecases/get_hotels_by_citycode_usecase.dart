import 'package:bouek/domain/models/hotel_model.dart';
import 'package:bouek/domain/repositories/hotel_repository.dart';

class GetHotelsByCitycodeUsecase {
  final HotelRepository _hotelRepository;

  GetHotelsByCitycodeUsecase(this._hotelRepository);

  Future<List<Hotel>> call(String cityCode) async {
    return _hotelRepository.getHotelsByCityCode(cityCode: cityCode);
  }
}