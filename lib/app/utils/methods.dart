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
  ApiSevices api = ApiSevices(api: Dio(), token: Token());
  final Response response1 = await api.getHotelByHotelId(hotelId);
  final hd = response1.data["data"][0] as Map<String,dynamic>;
  final Response response2 =
      await api.getimage(hd["geoCode"]['latitude'], hd["geoCode"]['longitude']);
  final String image = response2.data["businesses"][0]['image_url'];
  final String address =
      response2.data["businesses"][0]["location"]["address1"];
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
    "overallRating": sentiments.overallRating,
    "numberOfReviews": sentiments.numberOfReviews,
    "numberOfRatings": sentiments.numberOfRatings,
    "sentiments": sentiments,
    "offers": offers,
    "available": true,
    "countryCode": address,
    "rating": sentiments.overallRating * 0.05,
    "lastUpdate": hd['lastUpdate'],
    "imageUrl": image
  };
  return data;
}
