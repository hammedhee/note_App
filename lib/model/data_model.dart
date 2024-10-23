// import 'package:hive/hive.dart';

// @HiveType(typeId: 0)
// class Data {
//   @HiveField(0)
//   String? title;
//   @HiveField(1)
//   String? description;

//   Data({required this.title, required this.description});

// }

import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  Note({required this.title,required this.description});
}
