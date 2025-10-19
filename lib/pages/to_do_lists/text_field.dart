import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.6),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
        child: Container(
          color: Colors.amber,
          child: Row(
            children: [
              SizedBox(width: 10),
              TextField(decoration: InputDecoration(hintText: '새 할 일')),
            ],
          ),
        ),
      ),
    );
  }
}
