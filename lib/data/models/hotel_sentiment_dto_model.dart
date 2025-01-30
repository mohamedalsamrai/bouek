import 'package:bouek/data/models/sentiments_dto_model.dart';

class HotelSentimentDtoModel {
  String? type;
  int? numberOfReviews;
  int? numberOfRatings;
  String? hotelId;
  int? overallRating;
  SentimentsDtoModel? sentiments;

  HotelSentimentDtoModel(
    {
      this.type,
      this.numberOfReviews,
      this.numberOfRatings,
      this.hotelId,
      this.overallRating,
      this.sentiments
    }
  );

  HotelSentimentDtoModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    numberOfReviews = json['numberOfReviews'];
    numberOfRatings = json['numberOfRatings'];
    hotelId = json['hotelId'];
    overallRating = json['overallRating'];
    sentiments = json['sentiments'] != null
      ? SentimentsDtoModel.fromJson(json['sentiments'])
      : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['numberOfReviews'] = numberOfReviews;
    data['numberOfRatings'] = numberOfRatings;
    data['hotelId'] = hotelId;
    data['overallRating'] = overallRating;
    if (sentiments != null) {
      data['sentiments'] = sentiments!.toJson();
    }
    return data;
  }
}