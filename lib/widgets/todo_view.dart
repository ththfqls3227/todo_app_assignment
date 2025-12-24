import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_entity.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({
    super.key,
    required this.toDo,
    required this.onToggleFavorite,
    required this.onToggleDone,
    required this.onTap,
  });

  final TodoEntity toDo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final doneIcon = toDo.isDone ? Icons.check_circle : Icons.circle;
    final starIcon = toDo.isFavorite ? Icons.star : Icons.star_border;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8), // 수직 8
      padding: const EdgeInsets.symmetric(horizontal: 16), // 수평 16
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12), // 라운딩 12
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onToggleDone,
            icon: Icon(doneIcon),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Text(
                toDo.title,
                style: TextStyle(
                  fontSize: 16,
                  decoration:
                      toDo.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          IconButton(
            onPressed: onToggleFavorite,
            icon: Icon(starIcon),
          ),
        ],
      ),
    );
  }
}