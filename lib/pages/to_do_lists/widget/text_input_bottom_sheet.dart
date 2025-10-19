import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  //final String title;
  //final String? description;
  bool isDescription = true;
  bool isFavorite = false;
  //final bool isDone;

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: '새 할 일',
            hintStyle: TextStyle(fontSize: 16),
          ),
        ),
        isDescription
            ? SizedBox()
            : TextField(decoration: InputDecoration(hintText: '')),
        SizedBox(height: 10),
        Row(
          children: [
            isDescription
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isDescription = !isDescription;
                      });
                    },
                    icon: Icon(Icons.short_text_rounded, size: 24),
                  )
                : Container(),
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: isFavorite
                  ? Icon(
                      Icons.star,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Icon(Icons.star_border, size: 24),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                print('저장할래');
              },
              child: Text(
                "저장",
                style: TextStyle(color: Theme.of(context).dividerColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
