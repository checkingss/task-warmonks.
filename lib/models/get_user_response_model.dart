import 'dart:convert';

GetUserResponseModel getUserResponseModelFromJson(String str) =>
    GetUserResponseModel.fromJson(json.decode(str));

String getUserResponseModelToJson(GetUserResponseModel data) =>
    json.encode(data.toJson());

class GetUserResponseModel {
  final UserDetails? userDetails;
  final List<Role>? roles;
  final List<Permission>? permissions;

  GetUserResponseModel({
    this.userDetails,
    this.roles,
    this.permissions,
  });

  factory GetUserResponseModel.fromJson(Map<String, dynamic> json) =>
      GetUserResponseModel(
        userDetails: json["User Details"] == null
            ? null
            : UserDetails.fromJson(json["User Details"]),
        roles: json["Roles"] == null
            ? []
            : List<Role>.from(json["Roles"]!.map((x) => Role.fromJson(x))),
        permissions: json["Permissions"] == null
            ? []
            : List<Permission>.from(
                json["Permissions"]!.map((x) => Permission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "User Details": userDetails?.toJson(),
        "Roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "Permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x.toJson())),
      };
}

class Permission {
  final int? id;
  final String? name;
  final String? slug;
  final String? httpMethod;
  final String? httpPath;
  final PermissionPivot? pivot;

  Permission({
    this.id,
    this.name,
    this.slug,
    this.httpMethod,
    this.httpPath,
    this.pivot,
  });

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        httpMethod: json["http_method"],
        httpPath: json["http_path"],
        pivot: json["pivot"] == null
            ? null
            : PermissionPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "http_method": httpMethod,
        "http_path": httpPath,
        "pivot": pivot?.toJson(),
      };
}

class PermissionPivot {
  final String? userId;
  final String? permissionId;

  PermissionPivot({
    this.userId,
    this.permissionId,
  });

  factory PermissionPivot.fromJson(Map<String, dynamic> json) =>
      PermissionPivot(
        userId: json["user_id"],
        permissionId: json["permission_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "permission_id": permissionId,
      };
}

class Role {
  final int? id;
  final String? name;
  final String? slug;
  final RolePivot? pivot;

  Role({
    this.id,
    this.name,
    this.slug,
    this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        pivot: json["pivot"] == null ? null : RolePivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "pivot": pivot?.toJson(),
      };
}

class RolePivot {
  final String? userId;
  final String? roleId;

  RolePivot({
    this.userId,
    this.roleId,
  });

  factory RolePivot.fromJson(Map<String, dynamic> json) => RolePivot(
        userId: json["user_id"],
        roleId: json["role_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "role_id": roleId,
      };
}

class UserDetails {
  final String? id;
  final String? username;
  final String? password;
  final String? name;
  final String? phoneNumber;
  final String? address;
  final dynamic avatar;
  final String? token;
  final String? rememberToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserDetails({
    this.id,
    this.username,
    this.password,
    this.name,
    this.phoneNumber,
    this.address,
    this.avatar,
    this.token,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        avatar: json["avatar"],
        token: json["token"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "name": name,
        "phone_number": phoneNumber,
        "address": address,
        "avatar": avatar,
        "token": token,
        "remember_token": rememberToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
