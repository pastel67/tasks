import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showDecisionDialog(
  BuildContext context,
  String title,
  String nonActionText,
  String doingText,
  VoidCallback function,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        actions: [
          CupertinoDialogAction(
            child: Text(
              nonActionText,
              style: TextStyle(color: Colors.grey.withValues(alpha: 0.5)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text(
              doingText,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onPressed: () {
              function();
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
