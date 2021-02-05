import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:netguru/generator/ui/pages/generator_page.dart';
import 'package:netguru/netguru_values_manager.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<NetguruValuesManager>(NetguruValuesManager());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
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
