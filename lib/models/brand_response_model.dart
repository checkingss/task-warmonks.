import 'dart:convert';

BrandResponseModel brandResponseModelFromJson(String str) =>
    BrandResponseModel.fromJson(json.decode(str));

String brandResponseModelToJson(BrandResponseModel data) =>
    json.encode(data.toJson());

class BrandResponseModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  BrandResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory BrandResponseModel.fromJson(Map<String, dynamic> json) =>
      BrandResponseModel(
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
  final String? id;
  final String? category;
  final String? brand;

  Datum({
    this.id,
    this.category,
    this.brand,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
        brand: json["Brand"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "Brand": brand,
      };
}
