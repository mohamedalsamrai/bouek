import 'package:bouek/data/models/variations_dto_model.dart';
import 'package:bouek/domain/models/price_model.dart';

class PriceDtoModel {
  String? currency;
  String? base;
  String? total;
  VariationsDtoModel? variations;

  PriceDtoModel({this.currency, this.base, this.total, this.variations});

  PriceDtoModel.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    base = json['base'];
    total = json['total'];
    variations = json['variations'] != null
        ? VariationsDtoModel.fromJson(json['variations'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currency'] = currency;
    data['base'] = base;
    data['total'] = total;
    if (variations != null) {
      data['variations'] = variations!.toJson();
    }
    return data;
  }

  Price toDomainModel() => Price(currency ?? '', base ?? '', total ?? '');
}