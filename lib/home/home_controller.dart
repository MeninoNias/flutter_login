import 'package:login_flutter/shared/custom_dio/custom_dio.dart';

class HomeController {
  var _dio = CustomDio().getInstance;

  Future<List<AvisoModel>> getAllAviso() async {
    try {
      print(_dio..options.headers);
      var response = await _dio.get('http://10.0.3.2:8000/api/aviso/');
      print(response.toString());
      return (response.data as List)
          .map((e) => AvisoModel.fromJson(e))
          .toList();
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }
}

class AvisoModel {
  int id;
  String title;
  String texto;
  bool ativo;
  String createdAt;
  String updatedAt;

  AvisoModel(
      {this.id,
      this.title,
      this.texto,
      this.ativo,
      this.createdAt,
      this.updatedAt});

  AvisoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    texto = json['texto'];
    ativo = json['ativo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['texto'] = this.texto;
    data['ativo'] = this.ativo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
