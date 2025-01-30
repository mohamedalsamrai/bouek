class GuestsDtoModel {
  int? adults;

  GuestsDtoModel({this.adults});

  GuestsDtoModel.fromJson(Map<String, dynamic> json) {
    adults = json['adults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adults'] = adults;
    return data;
  }
}