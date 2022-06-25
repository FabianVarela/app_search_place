import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_app/src/features/home/data/model/address_model.dart';

part 'result_model.g.dart';

@JsonSerializable(createToJson: false)
class ResultModel extends Equatable {
  const ResultModel({required this.results});

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  final List<AddressModel> results;

  @override
  List<Object?> get props => [results];
}
