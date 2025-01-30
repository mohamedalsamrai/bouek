import 'package:bouek/data/models/yelp_attributes_dto_model.dart';
import 'package:bouek/data/models/yelp_business_hours_dto_model.dart';
import 'package:bouek/data/models/yelp_categories_dto_model.dart';
import 'package:bouek/data/models/yelp_coordinates_dto_model.dart';
import 'package:bouek/data/models/yelp_location_dto_model.dart';

class YelpHotelDtoModel {
  String? id;
  String? alias;
  String? name;
  String? imageUrl;
  bool? isClosed;
  String? url;
  int? reviewCount;
  List<YelpCategoriesDtoModel>? categories;
  int? rating;
  YelpCoordinatesDtoModel? coordinates;
  List<String>? transactions;
  String? price;
  YelpLocationDtoModel? location;
  String? phone;
  String? displayPhone;
  double? distance;
  List<YelpBusinessHoursDtoModel>? businessHours;
  YelpAttributesDtoModel? attributes;

  YelpHotelDtoModel(
    {
      this.id,
      this.alias,
      this.name,
      this.imageUrl,
      this.isClosed,
      this.url,
      this.reviewCount,
      this.categories,
      this.rating,
      this.coordinates,
      this.transactions,
      this.price,
      this.location,
      this.phone,
      this.displayPhone,
      this.distance,
      this.businessHours,
      this.attributes
    }
  );

  YelpHotelDtoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alias = json['alias'];
    name = json['name'];
    imageUrl = json['image_url'];
    isClosed = json['is_closed'];
    url = json['url'];
    reviewCount = json['review_count'];
    if (json['categories'] != null) {
      categories = <YelpCategoriesDtoModel>[];
      json['categories'].forEach((v) {
        categories!.add(YelpCategoriesDtoModel.fromJson(v));
      });
    }
    rating = json['rating'];
    coordinates = json['coordinates'] != null
        ? YelpCoordinatesDtoModel.fromJson(json['coordinates'])
        : null;
    if (json['transactions'] != null) {
      transactions = [];
      json['transactions'].forEach((v) { transactions!.add(v as String); });
    }
    price = json['price'];
    location = json['location'] != null
        ? YelpLocationDtoModel.fromJson(json['location'])
        : null;
    phone = json['phone'];
    displayPhone = json['display_phone'];
    distance = json['distance'];
    if (json['business_hours'] != null) {
      businessHours = <YelpBusinessHoursDtoModel>[];
      json['business_hours'].forEach((v) {
        businessHours!.add(YelpBusinessHoursDtoModel.fromJson(v));
      });
    }
    attributes = json['attributes'] != null
        ? YelpAttributesDtoModel.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['alias'] = alias;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['is_closed'] = isClosed;
    data['url'] = url;
    data['review_count'] = reviewCount;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['rating'] = rating;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    if (transactions != null) { data['transactions'] = transactions; }
    data['price'] = price;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['phone'] = phone;
    data['display_phone'] = displayPhone;
    data['distance'] = distance;
    if (businessHours != null) {
      data['business_hours'] =
          businessHours!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }

  String getImageUrl() => imageUrl ?? '';
}
