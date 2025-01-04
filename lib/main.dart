import 'package:flutter/material.dart';
import 'package:flutter09/counter_screen.dart';
import 'package:flutter09/insta_page.dart';
import 'package:flutter09/providers/counter_provider.dart';
import 'package:flutter09/providers/registration_provider.dart';
import 'package:flutter09/registration_form.dart';
import 'package:flutter09/todo_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'floor_db/todo_database.dart';

late TodoDatabase database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await $FloorTodoDatabase.databaseBuilder('todo_database.db').build();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
    ChangeNotifierProvider(create: (_) => RegistrationProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InstaPage(),
    );
  }
}

