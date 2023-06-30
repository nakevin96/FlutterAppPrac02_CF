import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_params_model.g.dart';

@JsonSerializable()
class CursorPaginationParamsModel {
  final String? after;
  final int? count;

  const CursorPaginationParamsModel({
    this.after,
    this.count,
  });

  factory CursorPaginationParamsModel.fromJson(Map<String, dynamic> json) =>
      _$CursorPaginationParamsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CursorPaginationParamsModelToJson(this);
}
