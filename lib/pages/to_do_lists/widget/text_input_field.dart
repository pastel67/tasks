import 'package:flutter/material.dart';

Container TextInputField(BuildContext context) {
  return Container(
    height: 120,
    width: double.infinity,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: '새 할 일',
            hintStyle: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            IconButton(
              onPressed: () {
                print('확장할래');
              },
              icon: Icon(Icons.edit_note, size: 24),
            ),
            IconButton(
              onPressed: () {
                print('즐겨찾기!');
              },
              icon: Icon(Icons.star_border, size: 24),
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
    ),
  );
}
