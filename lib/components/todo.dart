import 'package:flutter/material.dart';
import 'package:test_project/model/todo_model.dart';

class Todo extends StatelessWidget {
  const Todo({
    super.key,
    required this.todo,
    required this.toggleTodo,
    required this.deleteTodo,
  });
  final TodoModel todo;
  final void Function(bool?)? toggleTodo;
  final void Function()? deleteTodo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              todo.message,
              style: TextStyle(
                decoration:
                    todo.state
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),
          ),
          Checkbox(value: todo.state, onChanged: toggleTodo),
          IconButton(onPressed: deleteTodo, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
