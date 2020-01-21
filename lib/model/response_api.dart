import 'package:home_credit_flutter_task/model/section_model.dart';

class ResponseApi {
  List<SectionModel> data;

  List<SectionModel> get productSections =>
      data.where((item) => item.isProduct).toList();
  List<SectionModel> get articleSections =>
      data.where((item) => !item.isProduct).toList();

  ResponseApi({this.data});

  ResponseApi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<SectionModel>();
      json['data'].forEach((v) {
        data.add(new SectionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
