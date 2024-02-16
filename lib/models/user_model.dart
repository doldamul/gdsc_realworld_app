import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends Equatable {
  final String? email;
  final String? token;
  final String? username;
  final String? bio;
  final Uri? image;

  const UserModel({
    this.email,
    this.token,
    this.username,
    this.bio,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // TODO: copywith?

  @override
  List<Object?> get props => [
    email,
    token,
    username,
  ];
}