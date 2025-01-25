import 'package:bouek/domain/models/hotel_model.dart';
import 'package:bouek/domain/repositories/hotel_repository.dart';

class GetHotelByHotelIdUsecase {
  final HotelRepository _hotelRepository;

  GetHotelByHotelIdUsecase(this._hotelRepository);

  Future<Hotel> call(String hotelId) async {
    return _hotelRepository.getHotelByHotelId(hotelId: hotelId);
  }
}
