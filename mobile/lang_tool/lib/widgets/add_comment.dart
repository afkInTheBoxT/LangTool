import 'package:flutter/material.dart';

class AddComment extends StatefulWidget {
  AddComment({Key key}) : super(key: key);

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this._controller,
      maxLines: 10,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        // counterText: '${this._controller.text.split(' ').length} words',
        labelText: 'Напишіть що-небудь...',
        hintText: 'Напишіть що-небудь...',
        border: const OutlineInputBorder(),
      ),
      onChanged: (text) => setState(() {}),
    );
  }
}
