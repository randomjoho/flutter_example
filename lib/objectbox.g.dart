// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/local/model/home_search.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 7503117751264584016),
      name: 'HomeSearchModel',
      lastPropertyId: const IdUid(11, 6758034750685837105),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8007354485060452876),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 3125344025320181470),
            name: 'artist',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 4293004656474568778),
            name: 'summary',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4144824315920047444),
            name: 'category',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7650101674955792155),
            name: 'icon',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7096634984014719804),
            name: 'appId',
            type: 9,
            flags: 2048,
            indexId: const IdUid(1, 8714312081236464195)),
        ModelProperty(
            id: const IdUid(8, 5564710797961684532),
            name: 'averageUserRatingForCurrentVersion',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 1690216012393929172),
            name: 'userRatingCountForCurrentVersion',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 6758034750685837105),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 7503117751264584016),
      lastIndexId: const IdUid(1, 8714312081236464195),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [3713610031851507049, 4673292259405298816],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    HomeSearchModel: EntityDefinition<HomeSearchModel>(
        model: _entities[0],
        toOneRelations: (HomeSearchModel object) => [],
        toManyRelations: (HomeSearchModel object) => {},
        getId: (HomeSearchModel object) => object.id,
        setId: (HomeSearchModel object, int id) {
          object.id = id;
        },
        objectToFB: (HomeSearchModel object, fb.Builder fbb) {
          final artistOffset = fbb.writeString(object.artist);
          final summaryOffset = fbb.writeString(object.summary);
          final categoryOffset = fbb.writeString(object.category);
          final iconOffset = fbb.writeString(object.icon);
          final appIdOffset = fbb.writeString(object.appId);
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(12);
          fbb.addInt64(0, object.id);
          fbb.addOffset(2, artistOffset);
          fbb.addOffset(3, summaryOffset);
          fbb.addOffset(4, categoryOffset);
          fbb.addOffset(5, iconOffset);
          fbb.addOffset(6, appIdOffset);
          fbb.addFloat64(7, object.averageUserRatingForCurrentVersion);
          fbb.addInt64(8, object.userRatingCountForCurrentVersion);
          fbb.addOffset(10, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = HomeSearchModel(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 24, ''),
              artist: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              summary: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              category: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              icon: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              appId: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              averageUserRatingForCurrentVersion: const fb.Float64Reader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              userRatingCountForCurrentVersion: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 20));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [HomeSearchModel] entity fields to define ObjectBox queries.
class HomeSearchModel_ {
  /// see [HomeSearchModel.id]
  static final id =
      QueryIntegerProperty<HomeSearchModel>(_entities[0].properties[0]);

  /// see [HomeSearchModel.artist]
  static final artist =
      QueryStringProperty<HomeSearchModel>(_entities[0].properties[1]);

  /// see [HomeSearchModel.summary]
  static final summary =
      QueryStringProperty<HomeSearchModel>(_entities[0].properties[2]);

  /// see [HomeSearchModel.category]
  static final category =
      QueryStringProperty<HomeSearchModel>(_entities[0].properties[3]);

  /// see [HomeSearchModel.icon]
  static final icon =
      QueryStringProperty<HomeSearchModel>(_entities[0].properties[4]);

  /// see [HomeSearchModel.appId]
  static final appId =
      QueryStringProperty<HomeSearchModel>(_entities[0].properties[5]);

  /// see [HomeSearchModel.averageUserRatingForCurrentVersion]
  static final averageUserRatingForCurrentVersion =
      QueryDoubleProperty<HomeSearchModel>(_entities[0].properties[6]);

  /// see [HomeSearchModel.userRatingCountForCurrentVersion]
  static final userRatingCountForCurrentVersion =
      QueryIntegerProperty<HomeSearchModel>(_entities[0].properties[7]);

  /// see [HomeSearchModel.name]
  static final name =
      QueryStringProperty<HomeSearchModel>(_entities[0].properties[8]);
}
