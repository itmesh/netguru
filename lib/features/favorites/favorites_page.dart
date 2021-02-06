import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netguru/helpers/netguru_values_manager.dart';
import 'package:netguru/locator/service_locator.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final values = getIt.get<NetguruValuesManager>().favorites;
    return Scaffold(
      appBar: AppBar(
        title: Text('Values'),
        leading: CloseButton(),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: ListTile(
              title: Text(values[index].value),
            ),
          ),
        ),
        itemCount: values.length,
      ),
    );
  }
}
