import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo_entity.dart';
import 'package:flutter_todo_app/widgets/add_todo_bottom_sheet.dart';
import 'package:flutter_todo_app/widgets/no_todo_view.dart';
import 'package:flutter_todo_app/widgets/todo_view.dart';
import 'package:flutter_todo_app/pages/todo_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String appBarTitle = "솔빈's Tasks";
  final List<TodoEntity> todos = [];


  Future<void> addTodo() async {
    final newTodo = await showModalBottomSheet<TodoEntity>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AddTodoBottomSheet(),
        );
      },
    );

    if (newTodo != null) {
      setState(() {
        todos.add(newTodo);
      });
    }
  }

  void toggleDone(int index) {
    final t = todos[index];
    setState(() {
      todos[index] = TodoEntity(
        title: t.title,
        description: t.description,
        isFavorite: t.isFavorite,
        isDone: !t.isDone,
      );
    });
  }

  void toggleFavorite(int index) {
    final t = todos[index];
    setState(() {
      todos[index] = TodoEntity(
        title: t.title,
        description: t.description,
        isFavorite: !t.isFavorite,
        isDone: t.isDone,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF1C1C1E) : Colors.grey[200],
      centerTitle: true,
        title: Text(
          appBarTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: todos.isEmpty
          ? Align(
              alignment: Alignment.topCenter,
              child: NoTodoView(appBarTitle: appBarTitle),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ToDoView(
                    toDo: todos[index],
                    onToggleDone: () => toggleDone(index),
                    onToggleFavorite: () => toggleFavorite(index),
                    onTap: () async {
                      final updated = await Navigator.of(context).push<TodoEntity>(
                        MaterialPageRoute(
                          builder: (_) => ToDoDetailPage(todo: todos[index]),
                        ),
                      );

                      if (updated != null) {
                        setState(() {
                          todos[index] = updated;
                        });
                      }
                    },
                  );
                },
            ),
          ),

      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        backgroundColor: Colors.deepOrange,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 24),
        ),
      );
  }
}