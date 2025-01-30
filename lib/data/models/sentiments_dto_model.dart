class SentimentsDtoModel {
  int? sleepQuality;
  int? service;
  int? facilities;
  int? roomComforts;
  int? valueForMoney;
  int? catering;
  int? location;
  int? pointsOfInterest;
  int? staff;

  SentimentsDtoModel(
    {
      this.sleepQuality,
      this.service,
      this.facilities,
      this.roomComforts,
      this.valueForMoney,
      this.catering,
      this.location,
      this.pointsOfInterest,
      this.staff
    }
  );

  SentimentsDtoModel.fromJson(Map<String, dynamic> json) {
    sleepQuality = json['sleepQuality'];
    service = json['service'];
    facilities = json['facilities'];
    roomComforts = json['roomComforts'];
    valueForMoney = json['valueForMoney'];
    catering = json['catering'];
    location = json['location'];
    pointsOfInterest = json['pointsOfInterest'];
    staff = json['staff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sleepQuality'] = sleepQuality;
    data['service'] = service;
    data['facilities'] = facilities;
    data['roomComforts'] = roomComforts;
    data['valueForMoney'] = valueForMoney;
    data['catering'] = catering;
    data['location'] = location;
    data['pointsOfInterest'] = pointsOfInterest;
    data['staff'] = staff;
    return data;
  }
}
