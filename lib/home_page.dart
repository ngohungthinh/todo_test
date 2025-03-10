import 'package:flutter/material.dart';
import 'package:test_project/components/todo.dart';
import 'package:test_project/model/todo_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<TodoModel> todos = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo app"), centerTitle: true),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder:
            (context, index) => Todo(
              todo: todos[index],
              toggleTodo: (value) {
                setState(() {
                  todos[index].state = value ?? false;
                });
              },
              deleteTodo: () => deleteTodo(index),
            ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addTodos,
        child: Icon(Icons.add),
      ),
    );
  }

  void addTodos() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add todo'),
          content: TextField(controller: controller, maxLines: 10, minLines: 1),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  todos.add(TodoModel(message: controller.text, state: false));
                });
                controller.clear();
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                controller.clear();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void deleteTodo(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('You want to delete?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  todos.removeAt(index);
                });

                Navigator.pop(context);
              },
              child: Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
