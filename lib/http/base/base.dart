import 'package:json_annotation/json_annotation.dart';

part 'base.g.dart';

@JsonSerializable()
class Label {
  const Label({
    required this.label,
  });

  /// A necessary factory constructor for creating a new RecommendResp instance
  /// from a map. Pass the map to the generated `_$RecommendRespFromJson()` constructor.
  /// The constructor is named after the source class, in this case, RecommendResp.
  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

  final String label;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$RecommendRespToJson`.
  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
