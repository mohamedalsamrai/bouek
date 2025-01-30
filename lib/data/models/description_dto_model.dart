class DescriptionDtoModel {
  String? text;
  String? lang;

  DescriptionDtoModel({this.text, this.lang});

  DescriptionDtoModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['lang'] = lang;
    return data;
  }
}