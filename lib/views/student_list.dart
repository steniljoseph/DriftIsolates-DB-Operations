import 'package:drift_crud/database/studentdb.dart';
import 'package:drift_crud/main.dart';
import 'package:drift_crud/views/add_update.dart';
import 'package:drift_crud/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drift/drift.dart' as d;

class HomeScreen extends StatelessWidget {
  final bool wIso;
  const HomeScreen({Key? key, required this.wIso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Student Management"),
      ),
      body: wIso
          ? FutureBuilder(
              builder:
                  (BuildContext context, AsyncSnapshot<MyDatabase> snapshot) {
                if (snapshot.hasData) {
                  myDatabase = snapshot.data!;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        kHeight,
                        Center(
                          child: Text("With Isolates"),
                        ),
                        kHeight,
                        StreamBuilder<List<StudentData>>(
                          stream: myDatabase.getStudents(),
                          builder: (context, snapshot) {
                            final students = snapshot.data;
                            if (snapshot.data == null ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                child: Text("No Students Found"),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: students!.length,
                              separatorBuilder: (context, index) => kHeight,
                              itemBuilder: (context, index) {
                                final student = students[index];
                                return ListTile(
                                  title: Text(student.name.toUpperCase()),
                                  subtitle: Text(student.batch.toUpperCase()),
                                  trailing: Wrap(children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.to(
                                          AddUpdateStudent(
                                            isUpdate: true,
                                            stdDatas: StudentCompanion(
                                              id: d.Value(student.id),
                                              rollNo: d.Value(student.rollNo),
                                              name: d.Value(student.name),
                                              batch: d.Value(student.batch),
                                              place: d.Value(student.place),
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        final id = student.id;
                                        myDatabase.deleteStudent(id);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                      ),
                                    )
                                  ]),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              future: DbType.connectToDb(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  kHeight,
                  Center(
                    child: Text("Without Isolates"),
                  ),
                  kHeight,
                  StreamBuilder<List<StudentData>>(
                    stream: myDatabase.getStudents(),
                    builder: (context, snapshot) {
                      final students = snapshot.data;
                      if (snapshot.data == null || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("No Students Found"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: students!.length,
                        separatorBuilder: (context, index) => kHeight,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return ListTile(
                            title: Text(student.name),
                            subtitle: Text(student.batch),
                            trailing: Wrap(children: [
                              IconButton(
                                onPressed: () {
                                  Get.to(
                                    AddUpdateStudent(
                                      isUpdate: true,
                                      stdDatas: StudentCompanion(
                                        id: d.Value(student.id),
                                        rollNo: d.Value(student.rollNo),
                                        name: d.Value(student.name),
                                        batch: d.Value(student.batch),
                                        place: d.Value(student.place),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  final id = student.id;
                                  myDatabase.deleteStudent(id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              )
                            ]),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(
          AddUpdateStudent(
            isUpdate: false,
          ),
        ),
      ),
    );
  }
}
