import 'dart:convert';

import 'package:bouek/domain/models/policies_model.dart';

class PoliciesDtoModel extends Policies {
  PoliciesDtoModel(
    super.paymentType,
  );
  PoliciesDtoModel copyWith({
    String? paymentType,
  }) {
    return PoliciesDtoModel(
      paymentType ?? this.paymentType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paymentType': paymentType,
    };
  }

  factory PoliciesDtoModel.fromMap(Map<String, dynamic> map) {
    return PoliciesDtoModel(
      map['paymentType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PoliciesDtoModel.fromJson(String source) =>
      PoliciesDtoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PoliciesDtoModel(paymentType: $paymentType)';

  @override
  bool operator ==(covariant PoliciesDtoModel other) {
    if (identical(this, other)) return true;

    return other.paymentType == paymentType;
  }

  @override
  int get hashCode => paymentType.hashCode;
}
