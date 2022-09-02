import 'package:drift/drift.dart';

class Student extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get rollNo => integer()();
  TextColumn get name => text()();
  TextColumn get batch => text()();
  TextColumn get place => text()();
}
