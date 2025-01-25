import 'package:bouek/domain/models/sentiments_model.dart';

abstract class SentimentsRepository {
  Future<Sentiments> getSentimentsByHotelId({String hotelId});
}