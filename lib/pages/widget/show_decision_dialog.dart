import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showDecisionDialog({
  required BuildContext context,
  required String title,
  required String denyMessage,
  VoidCallback? denyFunction,
  required String acceptMessage,
  required VoidCallback acceptFunction,
}) {
  // 작업 선택 다이얼로그
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
              if (denyFunction == null) {
                Navigator.pop(context);
              } else {
                denyFunction();
                Navigator.pop(context);
              }
            },
          ),
          CupertinoDialogAction(
            child: Text(
              acceptMessage,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onPressed: () {
              acceptFunction();
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
