import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:netguru/resources/strings.dart';
import 'package:netguru/resources/text_styles.dart';
import 'package:netguru/theme/netguru_theme.dart';

typedef OnSave = void Function(BuildContext context, String value);

class AddNewValuePage extends StatefulWidget {
  final OnSave onSave;

  const AddNewValuePage({Key key, @required this.onSave}) : super(key: key);

  @override
  _AddNewValuePageState createState() => _AddNewValuePageState();
}

class _AddNewValuePageState extends State<AddNewValuePage>
    with TickerProviderStateMixin {
  final _textEditingController = TextEditingController();
  final _inputKey = GlobalKey<FormFieldState>();
  final _focusNode = FocusNode();
  bool showAddButton = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(
      () => setState(() => showAddButton = !_focusNode.hasFocus),
    );
  }

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
                    focusNode: _focusNode,
                    cursorColor: Theme.of(context).primaryColor,
                    validator: (value) => (value?.isEmpty ?? true)
                        ? Strings.emptyValueError
                        : null,
                    decoration: InputDecoration(
                      hintText: Strings.newValueHint,
                      hintStyle: TextStyles.caption.copyWith(
                        color: NetguruTheme.of(context)
                            .secondaryColor
                            .withOpacity(0.6),
                      ),
                    ),
                    style: TextStyles.bodyBold.copyWith(
                      height: 1.5,
                      color: NetguruTheme.of(context).secondaryColor,
                    ),
                    controller: _textEditingController,
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: AnimatedSize(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    vsync: this,
                    child: showAddButton
                        ? RaisedButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              if (_inputKey.currentState.validate()) {
                                widget.onSave(
                                    context, _textEditingController.text);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                Strings.addButtonText,
                                style: TextStyles.bodyBold
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          )
                        : SizedBox(),
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
    _focusNode.dispose();
    super.dispose();
  }
}
