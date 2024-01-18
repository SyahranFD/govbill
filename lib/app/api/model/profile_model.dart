// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int? id;
  String? username;
  String? email;
  String? phoneNumber;
  String? profilePicture;

  ProfileModel({
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.profilePicture,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "phone_number": phoneNumber,
    "profile_picture": profilePicture,
  };
}
