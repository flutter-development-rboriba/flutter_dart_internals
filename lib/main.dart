import 'package:flutter/material.dart';

import 'package:flutter_dart_internals/ui_updates_demo.dart';
import 'package:flutter_dart_internals/keys/checkable_todo_item.dart';
import 'package:flutter_dart_internals/keys/keys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter/Dart Internals'),
        ),
        body: const Keys(),
        // body: const UIUpdatesDemo(),
      ),
    );
  }
}
