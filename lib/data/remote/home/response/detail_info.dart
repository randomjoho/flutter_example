import 'package:json_annotation/json_annotation.dart';

/// This allows the `DetailInfo` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'detail_info.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class DetailInfo {
  const DetailInfo({
    required this.averageUserRatingForCurrentVersion,
    required this.userRatingCountForCurrentVersion,
    required this.trackId,
  });

  /// A necessary factory constructor for creating a new DetailInfo instance
  /// from a map. Pass the map to the generated `_$DetailInfoFromJson()` constructor.
  /// The constructor is named after the source class, in this case, DetailInfo.
  factory DetailInfo.fromJson(Map<String, dynamic> json) =>
      _$DetailInfoFromJson(json);

  final double averageUserRatingForCurrentVersion;
  final int userRatingCountForCurrentVersion;
  final int trackId;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$DetailInfoToJson`.
  Map<String, dynamic> toJson() => _$DetailInfoToJson(this);
}
