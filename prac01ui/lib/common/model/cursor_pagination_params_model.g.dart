// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_pagination_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CursorPaginationParamsModel _$CursorPaginationParamsModelFromJson(
        Map<String, dynamic> json) =>
    CursorPaginationParamsModel(
      after: json['after'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$CursorPaginationParamsModelToJson(
        CursorPaginationParamsModel instance) =>
    <String, dynamic>{
      'after': instance.after,
      'count': instance.count,
    };
