import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showDecisionDialog(
  {required BuildContext context,
  required String title,
  required String denyMessage,
  required String acceptMessage,
  required VoidCallback function,}
) {
  return showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        actions: [
          CupertinoDialogAction(
            child: Text(
              denyMessage,
              style: TextStyle(color: Colors.grey.withValues(alpha: 0.5)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text(
              acceptMessage,
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
