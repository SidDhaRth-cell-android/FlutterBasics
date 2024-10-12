import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter09/db/sql_helper.dart';
import 'package:flutter09/view/screens/user_detail_screen.dart';
import 'package:flutter09/vm/counter_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.notification?.title}');
}

MovieProvider movieProvider = MovieProvider();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onMessage.listen((remoteMessages) {
    print('Handling a message ${remoteMessages.notification?.title}');
  });

  var databasePath = await getDatabasesPath();
  movieProvider.open("${databasePath},movie.db");

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: UserDetailScreen(),
    );
  }
}
