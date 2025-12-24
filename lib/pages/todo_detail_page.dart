import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_entity.dart';

class ToDoDetailPage extends StatefulWidget {
  const ToDoDetailPage({
    super.key,
    required this.todo,
  });

  final TodoEntity todo;

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.todo.isFavorite;
  }

  TodoEntity _updatedTodo() {
    return TodoEntity(
      title: widget.todo.title,
      description: widget.todo.description,
      isFavorite: isFavorite,
      isDone: widget.todo.isDone,
    );
  }

  void _goBackWithResult() {
    Navigator.of(context).pop(_updatedTodo()); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBackWithResult, 
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite; 
              });
            },
            icon: Icon(isFavorite ? Icons.star : Icons.star_border),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.todo.title, 
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.short_text_rounded),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.todo.description ?? '세부 내용은 없습니다.',
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}