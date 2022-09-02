import 'package:flutter/material.dart';
import 'package:flutter_app_lifecycle/life_cycle_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(home: LifeCyleExample(title: 'FlutterLifeCycleExample'));
}
