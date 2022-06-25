// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      placeId: json['place_id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      rating: json['rating'] as num,
      geometry:
          GeometryModel.fromJson(json['geometry'] as Map<String, dynamic>),
    );
