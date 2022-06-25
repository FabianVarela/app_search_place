// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      results: (json['results'] as List<dynamic>)
          .map((dynamic e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
