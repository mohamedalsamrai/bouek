import 'package:bouek/domain/models/offer_model.dart';
import 'package:bouek/domain/models/sentiments_model.dart';

class Hotel {
  final String hotelId;
  final String name;
  final String imageUrl;
  final String chainCode;
  final String cityCode;
  final double latitude;
  final double longitude;
  final int overallRating;
  final int numberOfReviews;
  final int numberOfRatings;
  final Sentiments sentiments; // Ratings for different categories
  final List<Offer> offers;
  final bool available;
  final String countryCode;
  final double rating;
  final String lastUpdate;

  Hotel(
    this.hotelId,
    this.name,
    this.imageUrl,
    this.chainCode,
    this.cityCode,
    this.latitude,
    this.longitude,
    this.overallRating,
    this.numberOfReviews,
    this.numberOfRatings,
    this.sentiments,
    this.offers,
    this.available,
    this.countryCode,
    this.rating,
    this.lastUpdate,
  );
}
