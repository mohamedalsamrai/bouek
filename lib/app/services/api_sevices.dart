import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Token {
  final api = Dio();
  String token = '';
  static final _baseURL = dotenv.env['BASE_URL'] ?? '';
  static final _grant_type = dotenv.env['GRANT_TYPE'] ?? '';
  static final _client_id = dotenv.env['CLIENT_ID'] ?? '';
  static final _client_secret = dotenv.env['CLIENT_SECRET'] ?? '';
  Token() {
    api.options.baseUrl = _baseURL;
  }
  Future<String> getToken() async {
    final Response<Map<String, dynamic>> response =
        await api.post("/v1/security/oauth2/token",
            data: {
              "grant_type": _grant_type,
              "client_id": _client_id,
              "client_secret": _client_secret
            },
            options: Options(
              contentType: 'application/x-www-form-urlencoded',
            ));

    return response.data!["access_token"];
  }
}

class ApiSevices {
  final Dio api;
  final Token token;
  static final _baseURL = dotenv.env['BASE_URL'] ?? '';

  ApiSevices({required this.api, required this.token}) {
    api.options..baseUrl = _baseURL;
  }
  Future<Response> getHotelsByGeocode(double latitude, double longitude) async {
    final _token = await token.getToken();
    return api.get("/v1/reference-data/locations/hotels/by-geocode",
        queryParameters: {'latitude': latitude, 'longitude': longitude},
        options: Options(headers: {
          "Authorization": "Bearer $_token",
          "Accept": "application/vnd.amadeus+json"
        }));
  }

  Future<Response> getHotelsByCityCode(String cityCode) async {
    final _token = await token.getToken();
    return api.get('/v1/reference-data/locations/hotels/by-city',
        queryParameters: {"cityCode": cityCode},
        options: Options(headers: {
          "Authorization": "Bearer $_token",
          "Accept": "application/vnd.amadeus+json"
        }));
  }
  Future<Response> getHotelByHotelId(String hotelId) async{
    final _token = await token.getToken();
    return api.get('/v1/reference-data/locations/hotels/by-hotels',
        queryParameters: {"hotelIds": hotelId},
        options: Options(headers: {
          "Authorization": "Bearer $_token",
          "Accept": "application/vnd.amadeus+json"
        }));
  }
  Future<Response> getOffersByHotelID(String hotelID)async{
    final _token = await token.getToken();
    return api.get('/v3/shopping/hotel-offers',
        queryParameters: {"hotelIds": hotelID},
        options: Options(headers: {
          "Authorization": "Bearer $_token",
          "Accept": "application/vnd.amadeus+json"
        }));
  }
  Future<Response> getSentimentsByHotelId(String hotelID)async{
    final _token = await token.getToken();
    return api.get('/v2/e-reputation/hotel-sentiments',
        queryParameters: {"hotelIds": hotelID},
        options: Options(headers: {
          "Authorization": "Bearer $_token",
          "Accept": "application/vnd.amadeus+json"
        }));
  }
  
}
