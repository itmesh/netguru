import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:netguru/locator/service_locator.dart';
import 'package:netguru/helpers/netguru_values_manager.dart';
import 'package:netguru/resources/strings.dart';
import 'package:netguru/resources/text_styles.dart';

class ValuesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final values = getIt.get<NetguruValuesManager>().values;
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.values, style: TextStyles.bodyBold),
        leading: CloseButton(),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: ListTile(
              title: Text(values[index].value, style: TextStyles.caption),
            ),
          ),
        ),
        itemCount: values.length,
      ),
    );
  }
}
