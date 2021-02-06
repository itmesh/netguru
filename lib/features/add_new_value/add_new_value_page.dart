import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:netguru/helpers/netguru_values_manager.dart';
import 'package:netguru/locator/service_locator.dart';

class AddNewValuePage extends StatefulWidget {
  @override
  _AddNewValuePageState createState() => _AddNewValuePageState();
}

class _AddNewValuePageState extends State<AddNewValuePage> {
  final _textEditingController = TextEditingController();
  final _inputKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    showDialog()
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new value'),
        leading: CloseButton(),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    key: _inputKey,
                    validator: (value) => (value?.isEmpty ?? true)
                        ? 'Value can not ve empty'
                        : null,
                    decoration: InputDecoration(
                      hintText: 'Insert new Netguru value',
                    ),
                    controller: _textEditingController,
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    if (_inputKey.currentState.validate()) {
                      Navigator.of(context).maybePop();
                      getIt
                          .get<NetguruValuesManager>()
                          .add(_textEditingController.text);
                    }
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
