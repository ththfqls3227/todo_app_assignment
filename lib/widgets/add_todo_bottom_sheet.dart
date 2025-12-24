

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_entity.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}


class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  bool showDescription = false;
  bool isFavorite = false;

  void saveToDo() {
    final title = titleController.text.trim();
    if (title.isEmpty) return;

    final todo = TodoEntity(
      title: title,
      description: showDescription && descController.text.trim().isNotEmpty
          ? descController.text.trim()
          : null,
      isFavorite: isFavorite,
      isDone: false,
    );

    Navigator.of(context).pop(todo);
  }

  @override
  Widget build(BuildContext context) {
    final canSave = titleController.text.trim().isNotEmpty;

    return SizedBox(
      height: showDescription ? 260 : 160, 
      child: Column(
        children: [
          TextField(
            controller: titleController,
            autofocus: true,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              hintText: '새 할 일',
              border: InputBorder.none,
            ),
            textInputAction: TextInputAction.done,
            onChanged: (_) => setState(() {}), 
            onSubmitted: (_) => saveToDo(), 
          ),


          Row(
            children: [
              if (!showDescription)
                IconButton(
                  icon: const Icon(Icons.short_text_rounded, size: 24),
                  onPressed: () {
                    setState(() {
                      showDescription = true;
                    });
                  },
                ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  size: 24,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: canSave ? saveToDo : null,
                child: Text(
                  '저장',
                  style: TextStyle(
                    color: canSave ? Colors.black : Colors.black26,
                  ),
                ),
              ),
            ],
          ),

          if (showDescription)
            Expanded(
              child: TextField(
                controller: descController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: '세부정보 추가',
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
        ],
      ),
    );
  }
}