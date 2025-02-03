import 'package:bouek/app/presentation/di/locator_di.dart';
import 'package:bouek/app/services/api_sevices.dart';
import 'package:bouek/domain/models/offer_model.dart';
import 'package:bouek/domain/models/sentiments_model.dart';
import 'package:bouek/domain/usecases/get_offers_by_hotel_id_usecase.dart';
import 'package:bouek/domain/usecases/get_sentiments.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool checkUserState() {
  if (FirebaseAuth.instance.currentUser != null) {
    if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
      return true;
    }
  }
  return false;
}

Future<Map<String, dynamic>> getHotelMap(String hotelId) async {
  ApiSevices api=ApiSevices(api: Dio(), token: Token());
  final Response response1 = await api.getHotelByHotelId(hotelId);
  final hd = response1.data["data"][0];
  final Response response2 = await api.getSentimentsByHotelId('TELONMFS');
  final Response response3 = await api.getOffersByHotelID('MCLONGHM');
  final ho = response3.data['data'][0];
  final hr = response2.data["data"][0];
  final Sentiments sentiments = await s1<GetSentiments>().get('TELONMFS');
  final List<Offer> offers =
      await s1<GetOffersByHotelIdUsecase>().call('MCLONGHM');
  final data = <String, dynamic>{
    "hotelId": hd["hotelId"],
    "name": hd['name'],
    "chainCode": hd['chainCode'],
    "cityCode": hd["iataCode"],
    "latitude": hd["geoCode"]['latitude'],
    'longitude': hd["geoCode"]['longitude'],
    "overallRating": hr["overallRating"],
    "numberOfReviews": hr["numberOfReviews"],
    "numberOfRatings": hr['numberOfRatings'],
    "sentiments": sentiments,
    "offers": offers,
    "available": ho["available"],
    "countryCode": hd["address"]["countryCode"],
    "rating": hr["overallRating"] * 0.05,
    "lastUpdate": hd['lastUpdate'],
  };
  return data;
}
