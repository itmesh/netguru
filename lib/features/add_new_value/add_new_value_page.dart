import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:netguru/resources/strings.dart';
import 'package:netguru/resources/text_styles.dart';

typedef OnSave = void Function(BuildContext context, String value);

class AddNewValuePage extends StatefulWidget {
  final OnSave onSave;

  const AddNewValuePage({Key key, @required this.onSave}) : super(key: key);

  @override
  _AddNewValuePageState createState() => _AddNewValuePageState();
}

class _AddNewValuePageState extends State<AddNewValuePage> {
  final _textEditingController = TextEditingController();
  final _inputKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.newValueAppBarTitle, style: TextStyles.bodyBold),
        leading: CloseButton(),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(32.0),
                  child: TextFormField(
                    key: _inputKey,
                    cursorColor: Theme.of(context).primaryColor,
                    validator: (value) => (value?.isEmpty ?? true)
                        ? Strings.emptyValueError
                        : null,
                    decoration: InputDecoration(
                      hintText: Strings.newValueHint,
                      hintStyle: TextStyles.caption,
                    ),
                    style: TextStyles.bodyBold.copyWith(height: 1.5),
                    controller: _textEditingController,
                  ),
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_inputKey.currentState.validate()) {
                      widget.onSave(context, _textEditingController.text);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      Strings.addButtonText,
                      style: TextStyles.bodyBold.copyWith(color: Colors.white),
                    ),
                  ),
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
