// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentdb.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class StudentData extends DataClass implements Insertable<StudentData> {
  final int id;
  final int rollNo;
  final String name;
  final String batch;
  final String place;
  const StudentData(
      {required this.id,
      required this.rollNo,
      required this.name,
      required this.batch,
      required this.place});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['roll_no'] = Variable<int>(rollNo);
    map['name'] = Variable<String>(name);
    map['batch'] = Variable<String>(batch);
    map['place'] = Variable<String>(place);
    return map;
  }

  StudentCompanion toCompanion(bool nullToAbsent) {
    return StudentCompanion(
      id: Value(id),
      rollNo: Value(rollNo),
      name: Value(name),
      batch: Value(batch),
      place: Value(place),
    );
  }

  factory StudentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentData(
      id: serializer.fromJson<int>(json['id']),
      rollNo: serializer.fromJson<int>(json['rollNo']),
      name: serializer.fromJson<String>(json['name']),
      batch: serializer.fromJson<String>(json['batch']),
      place: serializer.fromJson<String>(json['place']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rollNo': serializer.toJson<int>(rollNo),
      'name': serializer.toJson<String>(name),
      'batch': serializer.toJson<String>(batch),
      'place': serializer.toJson<String>(place),
    };
  }

  StudentData copyWith(
          {int? id, int? rollNo, String? name, String? batch, String? place}) =>
      StudentData(
        id: id ?? this.id,
        rollNo: rollNo ?? this.rollNo,
        name: name ?? this.name,
        batch: batch ?? this.batch,
        place: place ?? this.place,
      );
  @override
  String toString() {
    return (StringBuffer('StudentData(')
          ..write('id: $id, ')
          ..write('rollNo: $rollNo, ')
          ..write('name: $name, ')
          ..write('batch: $batch, ')
          ..write('place: $place')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, rollNo, name, batch, place);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentData &&
          other.id == this.id &&
          other.rollNo == this.rollNo &&
          other.name == this.name &&
          other.batch == this.batch &&
          other.place == this.place);
}

class StudentCompanion extends UpdateCompanion<StudentData> {
  final Value<int> id;
  final Value<int> rollNo;
  final Value<String> name;
  final Value<String> batch;
  final Value<String> place;
  const StudentCompanion({
    this.id = const Value.absent(),
    this.rollNo = const Value.absent(),
    this.name = const Value.absent(),
    this.batch = const Value.absent(),
    this.place = const Value.absent(),
  });
  StudentCompanion.insert({
    this.id = const Value.absent(),
    required int rollNo,
    required String name,
    required String batch,
    required String place,
  })  : rollNo = Value(rollNo),
        name = Value(name),
        batch = Value(batch),
        place = Value(place);
  static Insertable<StudentData> custom({
    Expression<int>? id,
    Expression<int>? rollNo,
    Expression<String>? name,
    Expression<String>? batch,
    Expression<String>? place,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rollNo != null) 'roll_no': rollNo,
      if (name != null) 'name': name,
      if (batch != null) 'batch': batch,
      if (place != null) 'place': place,
    });
  }

  StudentCompanion copyWith(
      {Value<int>? id,
      Value<int>? rollNo,
      Value<String>? name,
      Value<String>? batch,
      Value<String>? place}) {
    return StudentCompanion(
      id: id ?? this.id,
      rollNo: rollNo ?? this.rollNo,
      name: name ?? this.name,
      batch: batch ?? this.batch,
      place: place ?? this.place,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rollNo.present) {
      map['roll_no'] = Variable<int>(rollNo.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (batch.present) {
      map['batch'] = Variable<String>(batch.value);
    }
    if (place.present) {
      map['place'] = Variable<String>(place.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentCompanion(')
          ..write('id: $id, ')
          ..write('rollNo: $rollNo, ')
          ..write('name: $name, ')
          ..write('batch: $batch, ')
          ..write('place: $place')
          ..write(')'))
        .toString();
  }
}

class $StudentTable extends Student with TableInfo<$StudentTable, StudentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _rollNoMeta = const VerificationMeta('rollNo');
  @override
  late final GeneratedColumn<int> rollNo = GeneratedColumn<int>(
      'roll_no', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _batchMeta = const VerificationMeta('batch');
  @override
  late final GeneratedColumn<String> batch = GeneratedColumn<String>(
      'batch', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _placeMeta = const VerificationMeta('place');
  @override
  late final GeneratedColumn<String> place = GeneratedColumn<String>(
      'place', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, rollNo, name, batch, place];
  @override
  String get aliasedName => _alias ?? 'student';
  @override
  String get actualTableName => 'student';
  @override
  VerificationContext validateIntegrity(Insertable<StudentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('roll_no')) {
      context.handle(_rollNoMeta,
          rollNo.isAcceptableOrUnknown(data['roll_no']!, _rollNoMeta));
    } else if (isInserting) {
      context.missing(_rollNoMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('batch')) {
      context.handle(
          _batchMeta, batch.isAcceptableOrUnknown(data['batch']!, _batchMeta));
    } else if (isInserting) {
      context.missing(_batchMeta);
    }
    if (data.containsKey('place')) {
      context.handle(
          _placeMeta, place.isAcceptableOrUnknown(data['place']!, _placeMeta));
    } else if (isInserting) {
      context.missing(_placeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rollNo: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}roll_no'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      batch: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}batch'])!,
      place: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}place'])!,
    );
  }

  @override
  $StudentTable createAlias(String alias) {
    return $StudentTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  _$MyDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $StudentTable student = $StudentTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [student];
}
