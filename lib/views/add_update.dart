import 'package:drift_crud/database/studentdb.dart';
import 'package:drift_crud/main.dart';
import 'package:drift_crud/views/constants.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as d;
import 'package:get/get.dart';

class AddUpdateStudent extends StatefulWidget {
  final bool isUpdate;

  final StudentCompanion? stdDatas;

  AddUpdateStudent({
    Key? key,
    required this.isUpdate,
    this.stdDatas,
  }) : super(key: key);

  @override
  State<AddUpdateStudent> createState() => _AddUpdateStudentState();
}

class _AddUpdateStudentState extends State<AddUpdateStudent> {
  final _globalKey = GlobalKey<FormState>();

  late StudentCompanion std;

  @override
  void initState() {
    super.initState();
    std = widget.stdDatas ??
        const StudentCompanion(
          rollNo: d.Value(0),
          name: d.Value(''),
          batch: d.Value(''),
          place: d.Value(''),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              _globalKey.currentState!.save();
              widget.isUpdate
                  ? await myDatabase.updateStudent(std)
                  : await myDatabase.insertStudent(std);
              Get.back();
            },
          ),
          kWidth,
        ],
        elevation: 0,
        centerTitle: true,
        title: widget.isUpdate
            ? const Text("Update Student")
            : const Text("Add Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: std.rollNo.value.toString(),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  std = std.copyWith(rollNo: d.Value(int.parse(value!)));
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Roll Number',
                ),
              ),
              kHeight,
              TextFormField(
                initialValue: std.name.value,
                onSaved: (value) {
                  std = std.copyWith(name: d.Value(value!));
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              kHeight,
              TextFormField(
                initialValue: std.batch.value,
                onSaved: (value) {
                  std = std.copyWith(batch: d.Value(value!));
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Batch',
                ),
              ),
              kHeight,
              TextFormField(
                initialValue: std.place.value,
                onSaved: (value) {
                  std = std.copyWith(place: d.Value(value!));
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Location',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
