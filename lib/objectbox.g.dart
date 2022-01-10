// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'app/core/models/products.dart';
import 'app/core/models/user.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 204162806172894567),
      name: 'Product',
      lastPropertyId: const IdUid(11, 2303068786060532757),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2831729270000875798),
            name: 'id',
            type: 6,
            flags: 129),
        ModelProperty(
            id: const IdUid(2, 554656439816764410),
            name: 'imageUrl',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 6885676659008347049),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7192941068691678056),
            name: 'price',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1806832013782958291),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 9087273787127741318),
            name: 'rate',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 6317637122879383392),
            name: 'marketName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5460249519727726040),
            name: 'marketAddress',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 6841867230825192828),
            name: 'count',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 7458681724540937644),
      name: 'User',
      lastPropertyId: const IdUid(8, 7062109085442459973),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4871231940826170039),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3259819669105268302),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2807759255818520166),
            name: 'fullName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1907127915889109479),
            name: 'number',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8757082682334954532),
            name: 'password',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2882028129555802450),
            name: 'city',
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
      lastEntityId: const IdUid(5, 5867724287179043533),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [
        1482706287452267906,
        2590766466655404404,
        5867724287179043533
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        2927366606893484586,
        3010950934496905616,
        5412283602732207495,
        648035459255756158,
        2032738642723874329,
        6675780195663817066,
        1670700699552006833,
        2527764579554836678,
        2367243320310716170,
        390171218489522946,
        3880852068605852151,
        3147441457274884414,
        3165043516563742995,
        1811133455107729555,
        6001790877205385181,
        2436002928164490342,
        6114285075629221764,
        205453540885444687,
        2617218773315207667,
        4189712222177958089,
        3615101659434128060,
        998967938585231172,
        24302296010342460,
        2488111221071118636,
        2303068786060532757,
        6343454075869241528,
        7062109085442459973
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Product: EntityDefinition<Product>(
        model: _entities[0],
        toOneRelations: (Product object) => [],
        toManyRelations: (Product object) => {},
        getId: (Product object) => object.id,
        setId: (Product object, int id) {
          object.id = id;
        },
        objectToFB: (Product object, fb.Builder fbb) {
          final imageUrlOffset = fbb.writeString(object.imageUrl);
          final nameOffset = fbb.writeString(object.name);
          final priceOffset = fbb.writeString(object.price);
          final descriptionOffset = fbb.writeString(object.description);
          final rateOffset = fbb.writeString(object.rate);
          final marketNameOffset = fbb.writeString(object.marketName);
          final marketAddressOffset = fbb.writeString(object.marketAddress);
          fbb.startTable(12);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, imageUrlOffset);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, priceOffset);
          fbb.addOffset(4, descriptionOffset);
          fbb.addOffset(5, rateOffset);
          fbb.addOffset(6, marketNameOffset);
          fbb.addOffset(7, marketAddressOffset);
          fbb.addInt64(8, object.count);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Product(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              description:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''),
              rate:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 14, ''),
              price:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
              marketAddress:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 18, ''),
              marketName:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 16, ''),
              imageUrl:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              count:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 20, 0));

          return object;
        }),
    User: EntityDefinition<User>(
        model: _entities[1],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final fullNameOffset = fbb.writeString(object.fullName);
          final numberOffset = fbb.writeString(object.number);
          final passwordOffset = fbb.writeString(object.password);
          final cityOffset = fbb.writeString(object.city);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, fullNameOffset);
          fbb.addOffset(3, numberOffset);
          fbb.addOffset(4, passwordOffset);
          fbb.addOffset(5, cityOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = User(
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              fullName:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''),
              password:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 12, ''),
              number:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 10, ''),
              city:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 14, ''))
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Product] entity fields to define ObjectBox queries.
class Product_ {
  /// see [Product.id]
  static final id = QueryIntegerProperty<Product>(_entities[0].properties[0]);

  /// see [Product.imageUrl]
  static final imageUrl =
      QueryStringProperty<Product>(_entities[0].properties[1]);

  /// see [Product.name]
  static final name = QueryStringProperty<Product>(_entities[0].properties[2]);

  /// see [Product.price]
  static final price = QueryStringProperty<Product>(_entities[0].properties[3]);

  /// see [Product.description]
  static final description =
      QueryStringProperty<Product>(_entities[0].properties[4]);

  /// see [Product.rate]
  static final rate = QueryStringProperty<Product>(_entities[0].properties[5]);

  /// see [Product.marketName]
  static final marketName =
      QueryStringProperty<Product>(_entities[0].properties[6]);

  /// see [Product.marketAddress]
  static final marketAddress =
      QueryStringProperty<Product>(_entities[0].properties[7]);

  /// see [Product.count]
  static final count =
      QueryIntegerProperty<Product>(_entities[0].properties[8]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[1].properties[0]);

  /// see [User.name]
  static final name = QueryStringProperty<User>(_entities[1].properties[1]);

  /// see [User.fullName]
  static final fullName = QueryStringProperty<User>(_entities[1].properties[2]);

  /// see [User.number]
  static final number = QueryStringProperty<User>(_entities[1].properties[3]);

  /// see [User.password]
  static final password = QueryStringProperty<User>(_entities[1].properties[4]);

  /// see [User.city]
  static final city = QueryStringProperty<User>(_entities[1].properties[5]);
}
