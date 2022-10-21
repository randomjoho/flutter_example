import 'package:example/data/local/model/home_search.dart';
import 'package:example/http/base/base.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `RecommendResp` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'recommend_resp.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class RecommendResp {
  const RecommendResp({
    required this.feed,
  });

  /// A necessary factory constructor for creating a new RecommendResp instance
  /// from a map. Pass the map to the generated `_$RecommendRespFromJson()` constructor.
  /// The constructor is named after the source class, in this case, RecommendResp.
  factory RecommendResp.fromJson(Map<String, dynamic> json) =>
      _$RecommendRespFromJson(json);

  final FeedResp feed;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RecommendRespToJson`.
  Map<String, dynamic> toJson() => _$RecommendRespToJson(this);
}

@JsonSerializable()
class FeedResp {
  const FeedResp({
    required this.entry,
  });

  /// A necessary factory constructor for creating a new RecommendResp instance
  /// from a map. Pass the map to the generated `_$RecommendRespFromJson()` constructor.
  /// The constructor is named after the source class, in this case, RecommendResp.
  factory FeedResp.fromJson(Map<String, dynamic> json) =>
      _$FeedRespFromJson(json);

  final List<RecommendEntry> entry;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RecommendRespToJson`.
  Map<String, dynamic> toJson() => _$FeedRespToJson(this);
}

@JsonSerializable()
class RecommendEntry {
  const RecommendEntry({
    required this.name,
    required this.summary,
    required this.artist,
    required this.images,
    required this.category,
    required this.idModel,
    this.averageUserRatingForCurrentVersion,
    this.userRatingCountForCurrentVersion,
  });

  /// A necessary factory constructor for creating a new RecommendResp instance
  /// from a map. Pass the map to the generated `_$RecommendRespFromJson()` constructor.
  /// The constructor is named after the source class, in this case, RecommendResp.
  factory RecommendEntry.fromJson(Map<String, dynamic> json) =>
      _$RecommendEntryFromJson(json);

  // 应用名称
  @JsonKey(name: 'im:name')
  final Label name;

  // 应用简介
  final Label summary;

  // 应用作者
  @JsonKey(name: 'im:artist')
  final Label artist;

  // 应用图标
  @JsonKey(name: 'im:image')
  final List<Label> images;

  // 应用类型
  final Category category;

  // 应用ID
  @JsonKey(name: 'id')
  final IDModel idModel;

  final double? averageUserRatingForCurrentVersion;
  final int? userRatingCountForCurrentVersion;

  String get appId => idModel.attributes.id;

  HomeSearchModel toSearchModel() {
    return HomeSearchModel(
      id: 0,
      appId: idModel.attributes.id,
      name: name.label,
      summary: summary.label,
      artist: artist.label,
      icon: images.last.label,
      category: category.attributes.label,
      averageUserRatingForCurrentVersion: averageUserRatingForCurrentVersion,
      userRatingCountForCurrentVersion: userRatingCountForCurrentVersion,
    );
  }

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RecommendRespToJson`.
  Map<String, dynamic> toJson() => _$RecommendEntryToJson(this);

  RecommendEntry copyWith({
    Label? name,
    Label? summary,
    Label? artist,
    List<Label>? images,
    Category? category,
    IDModel? idModel,
    double? averageUserRatingForCurrentVersion,
    int? userRatingCountForCurrentVersion,
  }) {
    return RecommendEntry(
      name: name ?? this.name,
      summary: summary ?? this.summary,
      artist: artist ?? this.artist,
      images: images ?? this.images,
      category: category ?? this.category,
      idModel: idModel ?? this.idModel,
      averageUserRatingForCurrentVersion: averageUserRatingForCurrentVersion ??
          this.averageUserRatingForCurrentVersion,
      userRatingCountForCurrentVersion: userRatingCountForCurrentVersion ??
          this.userRatingCountForCurrentVersion,
    );
  }
}

@JsonSerializable()
class Category {
  const Category({
    required this.attributes,
  });

  /// A necessary factory constructor for creating a new RecommendResp instance
  /// from a map. Pass the map to the generated `_$RecommendRespFromJson()` constructor.
  /// The constructor is named after the source class, in this case, RecommendResp.
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  final CategoryAttr attributes;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RecommendRespToJson`.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class IDModel {
  const IDModel({
    required this.attributes,
  });

  /// A necessary factory constructor for creating a new RecommendResp instance
  /// from a map. Pass the map to the generated `_$RecommendRespFromJson()` constructor.
  /// The constructor is named after the source class, in this case, RecommendResp.
  factory IDModel.fromJson(Map<String, dynamic> json) =>
      _$IDModelFromJson(json);

  final IDAttr attributes;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RecommendRespToJson`.
  Map<String, dynamic> toJson() => _$IDModelToJson(this);
}

@JsonSerializable()
class CategoryAttr {
  const CategoryAttr({
    required this.id,
    required this.label,
  });

  /// A necessary factory constructor for creating a new RecommendResp instance
  /// from a map. Pass the map to the generated `_$RecommendRespFromJson()` constructor.
  /// The constructor is named after the source class, in this case, RecommendResp.
  factory CategoryAttr.fromJson(Map<String, dynamic> json) =>
      _$CategoryAttrFromJson(json);

  @JsonKey(name: 'im:id')
  final String id;

  final String label;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RecommendRespToJson`.
  Map<String, dynamic> toJson() => _$CategoryAttrToJson(this);
}

@JsonSerializable()
class IDAttr {
  const IDAttr({
    required this.id,
    required this.bundleId,
  });

  /// A necessary factory constructor for creating a new RecommendResp instance
  /// from a map. Pass the map to the generated `_$RecommendRespFromJson()` constructor.
  /// The constructor is named after the source class, in this case, RecommendResp.
  factory IDAttr.fromJson(Map<String, dynamic> json) => _$IDAttrFromJson(json);

  @JsonKey(name: 'im:id')
  final String id;

  @JsonKey(name: 'im:bundleId')
  final String bundleId;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RecommendRespToJson`.
  Map<String, dynamic> toJson() => _$IDAttrToJson(this);
}
