import 'package:home_credit_flutter_task/model/item_model.dart';

class SectionModel {
  String section;
  String sectionTitle;
  List<ItemModel> items;

  bool get isProduct => section == "products";

  SectionModel({this.section, this.sectionTitle, this.items});

  SectionModel.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    sectionTitle = json['section_title'];
    if (json['items'] != null) {
      items = new List<ItemModel>();
      json['items'].forEach((v) {
        items.add(new ItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    data['section_title'] = this.sectionTitle;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
