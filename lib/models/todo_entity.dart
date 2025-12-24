import 'package:flutter/material.dart';

class TodoEntity {
  final String title;
  final String? description;
  final bool isFavorite;
  final bool isDone;

  const TodoEntity({
    required this.title,
    this.description,
    this.isFavorite = false,
    this.isDone = false,
  });

  TodoEntity copyWith({
    String? title,
    String? description,
    bool? isFavorite,
    bool? isDone,
  }) {
    return TodoEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      isDone: isDone ?? this.isDone,
    );
  }
}