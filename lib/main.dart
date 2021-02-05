import 'package:flutter/material.dart';

import 'package:netguru/features/generator/ui/pages/generator_page.dart';
import 'package:netguru/locator/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netguru values',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: GeneratorPage(),
    );
  }
}
