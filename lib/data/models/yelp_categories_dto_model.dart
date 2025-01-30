class YelpCategoriesDtoModel {
  String? alias;
  String? title;

  YelpCategoriesDtoModel({this.alias, this.title});

  YelpCategoriesDtoModel.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alias'] = alias;
    data['title'] = title;
    return data;
  }
}