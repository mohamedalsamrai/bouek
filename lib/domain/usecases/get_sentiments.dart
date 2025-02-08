import 'package:bouek/domain/models/sentiments_model.dart';
import 'package:bouek/domain/repositories/hotel_repository.dart';
import 'package:bouek/domain/repositories/sentiments_repository.dart';

class GetSentiments {
  final SentimentsRepository sentimentsRepository;
  GetSentiments(this.sentimentsRepository);
  Future<Sentiments> get(String hotelId) =>
      sentimentsRepository.getSentimentsByHotelId(hotelId);
}
