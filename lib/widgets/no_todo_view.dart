
import 'package:flutter/material.dart';

class NoTodoView extends StatelessWidget{

  String? appBarTitle;

  NoTodoView({super.key, this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? const Color(0xFF1C1C1E) : Colors.grey[200],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icon.webp',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 12),
          Text(
            '아직 할 일이 없음',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '할 일을 추가하고 $appBarTitle에서\n할 일을 추적하세요.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}