// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignupResponseModelAdapter extends TypeAdapter<SignupResponseModel> {
  @override
  final int typeId = 6;

  @override
  SignupResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignupResponseModel(
      phone: fields[98] as String,
      image: fields[69] as String,
      name: fields[66] as String,
      email: fields[67] as String,
      token: fields[86] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SignupResponseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(66)
      ..write(obj.name)
      ..writeByte(67)
      ..write(obj.email)
      ..writeByte(86)
      ..write(obj.token)
      ..writeByte(69)
      ..write(obj.image)
      ..writeByte(98)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignupResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      phone: json['phone'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$SignupResponseModelToJson(
        SignupResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
      'image': instance.image,
      'phone': instance.phone,
    };
