// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_info_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailInfoResp _$DetailInfoRespFromJson(Map<String, dynamic> json) =>
    DetailInfoResp(
      resultCount: json['resultCount'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => DetailInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailInfoRespToJson(DetailInfoResp instance) =>
    <String, dynamic>{
      'resultCount': instance.resultCount,
      'results': instance.results,
    };
