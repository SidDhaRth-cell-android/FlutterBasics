import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter09/view/active/post_screen.dart';
import 'package:flutter09/vm/user_viewmodel.dart';
import 'package:provider/provider.dart';

const channel = MethodChannel("com.flutter09");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isAndroid){
    final returnValue = await channel.invokeMethod("display");
    print(returnValue);
  }

  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserViewmodel())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: PostScreen(),
    );
  }
}
