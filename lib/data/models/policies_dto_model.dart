import 'dart:convert';

import 'package:bouek/domain/models/policies_model.dart';

class PoliciesDtoModel extends Policies {
  PoliciesDtoModel(super.paymentType, super.cancellationPolicy, super.refundable);
   PoliciesDtoModel copyWith({
    String? paymentType,
    String? cancellationPolicy,
    bool? refundable,
  }) {
    return PoliciesDtoModel(
      paymentType ?? this.paymentType,
      cancellationPolicy ?? this.cancellationPolicy,
      refundable ?? this.refundable,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paymentType': paymentType,
      'cancellationPolicy': cancellationPolicy,
      'refundable': refundable,
    };
  }

  factory PoliciesDtoModel.fromMap(Map<String, dynamic> map) {
    return PoliciesDtoModel(
      map['paymentType'] as String,
      map['cancellationPolicy'] as String,
      map['refundable'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PoliciesDtoModel.fromJson(String source) => PoliciesDtoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PoliciesDtoModel(paymentType: $paymentType, cancellationPolicy: $cancellationPolicy, refundable: $refundable)';

  @override
  bool operator ==(covariant PoliciesDtoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.paymentType == paymentType &&
      other.cancellationPolicy == cancellationPolicy &&
      other.refundable == refundable;
  }

  @override
  int get hashCode => paymentType.hashCode ^ cancellationPolicy.hashCode ^ refundable.hashCode;
}