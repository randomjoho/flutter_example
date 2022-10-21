// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailInfo _$DetailInfoFromJson(Map<String, dynamic> json) => DetailInfo(
      averageUserRatingForCurrentVersion:
          (json['averageUserRatingForCurrentVersion'] as num).toDouble(),
      userRatingCountForCurrentVersion:
          json['userRatingCountForCurrentVersion'] as int,
      trackId: json['trackId'] as int,
    );

Map<String, dynamic> _$DetailInfoToJson(DetailInfo instance) =>
    <String, dynamic>{
      'averageUserRatingForCurrentVersion':
          instance.averageUserRatingForCurrentVersion,
      'userRatingCountForCurrentVersion':
          instance.userRatingCountForCurrentVersion,
      'trackId': instance.trackId,
    };
