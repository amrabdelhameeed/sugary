import 'dart:math';

import 'package:flutter/material.dart';

class ReusableTextDialog extends StatefulWidget {
  final Function(String) onAddPressed;
  final String? initialText;

  const ReusableTextDialog({Key? key, required this.onAddPressed, this.initialText}) : super(key: key);

  @override
  ReusableTextDialogState createState() => ReusableTextDialogState();
}

class ReusableTextDialogState extends State<ReusableTextDialog> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.initialText ?? "";
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              maxLines: 2,
              autofillHints: Iterable.generate(5, (index) {
                return "Achievement ${Random().nextInt(7) + 1}";
              }),
              decoration: InputDecoration(hintText: "Achievement ${Random().nextInt(7) + 1}", hintStyle: TextStyle(color: Colors.white.withOpacity(0.4))),
              autofocus: true,
              controller: _textController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                } else if (value.length < 3) {
                  return 'Text must be at least 3 characters';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              Navigator.pop(context, _textController.text);
            }
          },
          child: Text(widget.initialText == null ? "Add" : "Edit"),
        ),
      ],
    );
  }
}
