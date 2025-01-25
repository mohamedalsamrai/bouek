import 'package:bouek/domain/models/sentiments_model.dart';
import 'package:bouek/domain/repositories/sentiments_repository.dart';

class GetSentimentsByHotelIdUsecase {
  final SentimentsRepository _sentimentsRepository;

  GetSentimentsByHotelIdUsecase(this._sentimentsRepository);

  Future<Sentiments> call(String hotelId) async {
    return _sentimentsRepository.getSentimentsByHotelId(hotelId: hotelId);
  }
}