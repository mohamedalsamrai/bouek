import 'package:bouek/data/models/cancellation_dto_model.dart';
import 'package:bouek/domain/models/policies_model.dart';

class PoliciesDtoModel {
  String? paymentType;
  CancellationDtoModel? cancellation;

  PoliciesDtoModel({this.paymentType, this.cancellation});

  PoliciesDtoModel.fromJson(Map<String, dynamic> json) {
    paymentType = json['paymentType'];
    cancellation = json['cancellation'] != null
        ? CancellationDtoModel.fromJson(json['cancellation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentType'] = paymentType;
    if (cancellation != null) {
      data['cancellation'] = cancellation!.toJson();
    }
    return data;
  }

  Policies toDomainModel() => Policies(
    paymentType ?? '',
    cancellation?.description?.text ?? '',
    cancellation?.type != 'FULL_STAY'
  );
}