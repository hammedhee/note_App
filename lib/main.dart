import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:note_app/model/data_model.dart';
import 'package:note_app/view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home:const  HomePage(),
      debugShowCheckedModeBanner: false,
      title: "Note App",
    );
  }
}
