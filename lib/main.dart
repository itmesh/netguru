import 'package:flutter/material.dart';
import 'package:netguru/generator/ui/pages/generator_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: GeneratorPage(),
    );
  }
}