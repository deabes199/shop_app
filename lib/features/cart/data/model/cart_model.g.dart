// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 12;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      id: fields[30] as int?,
      category: fields[35] as String?,
      title: fields[31] as String?,
      image: fields[32] as String?,
      price: fields[33] as double?,
      quantity: fields[34] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(30)
      ..write(obj.id)
      ..writeByte(31)
      ..write(obj.title)
      ..writeByte(32)
      ..write(obj.image)
      ..writeByte(33)
      ..write(obj.price)
      ..writeByte(34)
      ..write(obj.quantity)
      ..writeByte(35)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: (json['id'] as num?)?.toInt(),
      category: json['category'] as String?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'price': instance.price,
      'quantity': instance.quantity,
      'category': instance.category,
    };
