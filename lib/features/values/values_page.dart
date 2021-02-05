import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netguru/locator/service_locator.dart';
import 'package:netguru/helpers/netguru_values_manager.dart';

class ValuesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final values = getIt.get<NetguruValuesManager>().values;
    return Scaffold(
      appBar: AppBar(
        title: Text('Values'),
        leading: CloseButton(),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Dismissible(
            onDismissed: (_) {},
            background: Card(
              child: Container(
                color: Colors.red,
              ),
            ),
            key: ValueKey(index),
            child: Card(
              child: ListTile(
                title: Text(values[index].value),
              ),
            ),
          ),
        ),
        itemCount: values.length,
      ),
    );
  }
}
