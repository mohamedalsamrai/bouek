import 'package:bouek/data/models/average_dto_model.dart';
import 'package:bouek/data/models/changes_dto_model.dart';

class VariationsDtoModel {
  AverageDtoModel? average;
  List<ChangesDtoModel>? changes;

  VariationsDtoModel({this.average, this.changes});

  VariationsDtoModel.fromJson(Map<String, dynamic> json) {
    average =
    json['average'] != null ? AverageDtoModel.fromJson(json['average']) : null;
    if (json['changes'] != null) {
      changes = <ChangesDtoModel>[];
      json['changes'].forEach((v) {
        changes!.add(ChangesDtoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (average != null) {
      data['average'] = average!.toJson();
    }
    if (changes != null) {
      data['changes'] = changes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}