import 'dart:convert';

CategoryResponseModel categoryResponseModelFromJson(String str) =>
    CategoryResponseModel.fromJson(json.decode(str));

String categoryResponseModelToJson(CategoryResponseModel data) =>
    json.encode(data.toJson());

class CategoryResponseModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  CategoryResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? catgName;
  final String? active;

  Datum({
    this.id,
    this.catgName,
    this.active,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        catgName: json["catg_name"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catg_name": catgName,
        "active": active,
      };
}
