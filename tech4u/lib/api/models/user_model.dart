import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String? id;
  final String userName;
  final String email;
  final String password;
  final bool? isAdmin;
  final String? userPhoto;
  final List<String>? courses;
  String? token;

  User(
      {this.id,
      this.token,
      required this.userName,
      required this.email,
      required this.password,
      this.isAdmin,
      this.courses,
      this.userPhoto});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
