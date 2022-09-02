import 'dart:io';
import 'dart:isolate';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:drift_crud/database/student.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'studentdb.g.dart';

@DriftDatabase(tables: [Student])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(NativeDatabase.memory());

  MyDatabase.connect(DatabaseConnection connection) : super.connect(connection);

  @override
  int get schemaVersion => 1;

  Stream<List<StudentData>> getStudents() => select(student).watch();

  Future updateStudent(StudentCompanion entity) =>
      update(student).replace(entity);

  Future<void> insertStudent(StudentCompanion entity) async =>
      await into(student).insert(entity);

  Future deleteStudent(int id) async =>
      await (delete(student)..where((tbl) => tbl.id.equals(id))).go();
}

Future<DriftIsolate> _createDriftIsolate() async {
  final dir = await getApplicationDocumentsDirectory();
  final path = p.join(dir.path, 'db.sqlite');
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, path),
  );

  return await receivePort.first as DriftIsolate;
}

void _startBackground(_IsolateStartRequest request) {
  final executor = NativeDatabase(File(request.targetPath));

  final driftIsolate = DriftIsolate.inCurrent(
    () => DatabaseConnection(executor),
  );

  request.sendDriftIsolate.send(driftIsolate);
}

Future<DatabaseConnection> createDriftIsolateAndConnect() async {
  final isolate = await _createDriftIsolate();
  return await isolate.connect();
}

class _IsolateStartRequest {
  final SendPort sendDriftIsolate;
  final String targetPath;

  _IsolateStartRequest(this.sendDriftIsolate, this.targetPath);
}
