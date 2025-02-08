import 'dart:convert';

import 'package:bouek/domain/models/price_model.dart';

class PriceDtoModel extends Price {
  PriceDtoModel(super.currency, super.base, super.total);
 PriceDtoModel copyWith({
    String? currency,
    String? base,
    String? total,
  }) {
    return PriceDtoModel(
      currency ?? this.currency,
      base ?? this.base,
      total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currency': currency,
      'base': base,
      'total': total,
    };
  }

  factory PriceDtoModel.fromMap(Map<String, dynamic> map) {
    return PriceDtoModel(
      map['currency'] as String,
      map['base'] as String,
      map['total'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceDtoModel.fromJson(String source) => PriceDtoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PriceDtoModel(currency: $currency, base: $base, total: $total)';

  @override
  bool operator ==(covariant PriceDtoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.currency == currency &&
      other.base == base &&
      other.total == total;
  }

  @override
  int get hashCode => currency.hashCode ^ base.hashCode ^ total.hashCode;
}