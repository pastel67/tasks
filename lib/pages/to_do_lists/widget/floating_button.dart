import 'package:flutter/material.dart';
import 'package:tasks/pages/to_do_lists/widget/text_input_bottom_sheet.dart';

FloatingActionButton floatingButton(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: Theme.of(context).colorScheme.primary,
    shape: CircleBorder(),
    onPressed: () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: TextInputField(),
          );
        },
      );
    },
    child: Icon(Icons.add, size: 24),
  );
}
