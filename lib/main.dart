import 'package:flutter/material.dart';
import 'package:flutter09/view/screens/counter_screen.dart';
import 'package:flutter09/vm/counter_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  /* WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
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
      home: CounterScreen(),
    );
  }
}
