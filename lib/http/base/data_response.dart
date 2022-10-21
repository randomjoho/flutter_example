import 'package:json_annotation/json_annotation.dart';

/// This allows the `DataResponse` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'data_response.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  const DataResponse({
    required this.data,
  });

  /// A necessary factory constructor for creating a new DataResponse instance
  /// from a map. Pass the map to the generated `_$DataResponseFromJson()` constructor.
  /// The constructor is named after the source class, in this case, DataResponse.
  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    try {
      return _$DataResponseFromJson(json, fromJsonT);
    } catch (error) {
      rethrow;
    }
  }
  // final int code;
  // final String msg;
  final T data;

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$DataResponseToJson`.
  Map<String, dynamic> toJson(Function(T value) toJsonT) =>
      _$DataResponseToJson(this, toJsonT);
}
