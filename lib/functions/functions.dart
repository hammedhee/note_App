import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/model/data_model.dart';

ValueNotifier<List<Note>> note_notifire = ValueNotifier([]);
Future addData(Note values) async {
  final noteDb = await Hive.openBox<Note>('MyBox');
  await noteDb.add(values);
  note_notifire.value.add(values);
  note_notifire.notifyListeners();
}

Future getAllData() async {
  final noteDb = await Hive.openBox<Note>('MyBox');
  note_notifire.value.clear();
  note_notifire.value.addAll(noteDb.values);
  note_notifire.notifyListeners();
}

Future<void> deleteNote(int index) async {
  final noteDb = await Hive.openBox<Note>("MyBox");
  await noteDb.deleteAt(index);
  getAllData();
}

Future editNoteData(index, Note values) async {
  final noteDb = await Hive.openBox<Note>('MyBox');
  note_notifire.value.clear();
  note_notifire.value.addAll(noteDb.values);
  note_notifire.notifyListeners();
  noteDb.putAt(index, values);
  getAllData();
  
}
