// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendResp _$RecommendRespFromJson(Map<String, dynamic> json) =>
    RecommendResp(
      feed: FeedResp.fromJson(json['feed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendRespToJson(RecommendResp instance) =>
    <String, dynamic>{
      'feed': instance.feed,
    };

FeedResp _$FeedRespFromJson(Map<String, dynamic> json) => FeedResp(
      entry: (json['entry'] as List<dynamic>)
          .map((e) => RecommendEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedRespToJson(FeedResp instance) => <String, dynamic>{
      'entry': instance.entry,
    };

RecommendEntry _$RecommendEntryFromJson(Map<String, dynamic> json) =>
    RecommendEntry(
      name: Label.fromJson(json['im:name'] as Map<String, dynamic>),
      summary: Label.fromJson(json['summary'] as Map<String, dynamic>),
      artist: Label.fromJson(json['im:artist'] as Map<String, dynamic>),
      images: (json['im:image'] as List<dynamic>)
          .map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      idModel: IDModel.fromJson(json['id'] as Map<String, dynamic>),
      averageUserRatingForCurrentVersion:
          (json['averageUserRatingForCurrentVersion'] as num?)?.toDouble(),
      userRatingCountForCurrentVersion:
          json['userRatingCountForCurrentVersion'] as int?,
    );

Map<String, dynamic> _$RecommendEntryToJson(RecommendEntry instance) =>
    <String, dynamic>{
      'im:name': instance.name,
      'summary': instance.summary,
      'im:artist': instance.artist,
      'im:image': instance.images,
      'category': instance.category,
      'id': instance.idModel,
      'averageUserRatingForCurrentVersion':
          instance.averageUserRatingForCurrentVersion,
      'userRatingCountForCurrentVersion':
          instance.userRatingCountForCurrentVersion,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      attributes:
          CategoryAttr.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'attributes': instance.attributes,
    };

IDModel _$IDModelFromJson(Map<String, dynamic> json) => IDModel(
      attributes: IDAttr.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IDModelToJson(IDModel instance) => <String, dynamic>{
      'attributes': instance.attributes,
    };

CategoryAttr _$CategoryAttrFromJson(Map<String, dynamic> json) => CategoryAttr(
      id: json['im:id'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$CategoryAttrToJson(CategoryAttr instance) =>
    <String, dynamic>{
      'im:id': instance.id,
      'label': instance.label,
    };

IDAttr _$IDAttrFromJson(Map<String, dynamic> json) => IDAttr(
      id: json['im:id'] as String,
      bundleId: json['im:bundleId'] as String,
    );

Map<String, dynamic> _$IDAttrToJson(IDAttr instance) => <String, dynamic>{
      'im:id': instance.id,
      'im:bundleId': instance.bundleId,
    };
