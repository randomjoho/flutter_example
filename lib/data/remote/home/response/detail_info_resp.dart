import 'package:example/data/remote/home/response/detail_info.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `DetailInfoResp` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'detail_info_resp.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class DetailInfoResp {
  const DetailInfoResp({
    required this.resultCount,
    required this.results,
  });

  /// A necessary factory constructor for creating a new DetailInfoResp instance
  /// from a map. Pass the map to the generated `_$DetailInfoRespFromJson()` constructor.
  /// The constructor is named after the source class, in this case, DetailInfoResp.
  factory DetailInfoResp.fromJson(Map<String, dynamic> json) =>
      _$DetailInfoRespFromJson(json);

  final int resultCount;

  final List<DetailInfo> results;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$DetailInfoRespToJson`.
  Map<String, dynamic> toJson() => _$DetailInfoRespToJson(this);
}
