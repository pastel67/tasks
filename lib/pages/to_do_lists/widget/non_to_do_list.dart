import 'package:flutter/material.dart';

class NonToDoList extends StatelessWidget {
  final String appTitle;

  const NonToDoList(this.appTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.7),
        ),
        height: 250,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 12),
            Image.asset(
              'assets/list_plus.webp',
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 12),
            Text(
              "아직 할 일이 없음",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              "할 일을 추가 하고 $appTitle 에서 \n할 일을 추적하세요.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
