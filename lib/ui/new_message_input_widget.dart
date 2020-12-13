import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messager_flutter/model/database.dart';
import 'package:provider/provider.dart';

class NewMessageInput extends StatelessWidget {
  final String _labelText = 'Message';
  final _textMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textMessageController.clear();

    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [_buildTextField(context), _buildSendButton(context)],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _textMessageController,
        maxLines: 5,
        minLines: 1,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            labelText: _labelText),
      ),
    );
  }

  IconButton _buildSendButton(BuildContext context) {
    final AppDatabase database = Provider.of(context);

    return IconButton(
        icon: Icon(Icons.send),
        color: Theme.of(context).accentColor,
        onPressed: () {
          if (_textMessageController.text == "") {
            print("data not found");
          } else {
            database.insertMessage(
                new Message(id: null, message: _textMessageController.text));
            _textMessageController.clear();
          }
        });
  }
}
