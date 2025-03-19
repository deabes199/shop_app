import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_response_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)
class SignupResponseModel {
  @HiveField(66)
  final String name;
   @HiveField(67)
  final String email;
   @HiveField(86)
  final String token;
   @HiveField(69)
  final String image;
   @HiveField(98)
  final String phone;

  SignupResponseModel(
      {required this.phone,
      required this.image,
      required this.name,
      required this.email,
      required this.token});
  factory SignupResponseModel.fromJson(Map<String, dynamic> data) =>
      _$SignupResponseModelFromJson(data);
  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}
