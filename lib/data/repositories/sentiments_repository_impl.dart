import 'package:bouek/data/datasources/network_datasource.dart';
import 'package:bouek/domain/models/sentiments_model.dart';
import 'package:bouek/domain/repositories/sentiments_repository.dart';

class SentimentsRepositoryImpl extends SentimentsRepository {
  final NetworkDatasource networkDatasource;

  SentimentsRepositoryImpl(this.networkDatasource);

  @override
  Future<Sentiments> getSentimentsByHotelId(String hotelId) {
    return networkDatasource.getSentimentsByHotelId(hotelId);
  }
}