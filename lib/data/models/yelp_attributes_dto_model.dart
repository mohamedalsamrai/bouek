class YelpAttributesDtoModel {
  Null businessTempClosed;
  String? menuUrl;
  Null open24Hours;
  bool? waitlistReservation;

  YelpAttributesDtoModel(
      {this.businessTempClosed,
        this.menuUrl,
        this.open24Hours,
        this.waitlistReservation});

  YelpAttributesDtoModel.fromJson(Map<String, dynamic> json) {
    businessTempClosed = json['business_temp_closed'];
    menuUrl = json['menu_url'];
    open24Hours = json['open24_hours'];
    waitlistReservation = json['waitlist_reservation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_temp_closed'] = businessTempClosed;
    data['menu_url'] = menuUrl;
    data['open24_hours'] = open24Hours;
    data['waitlist_reservation'] = waitlistReservation;
    return data;
  }
}