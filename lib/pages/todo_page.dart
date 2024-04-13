// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();

  List todoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
    ["Make it", false],
  ];

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        todoList.add([_controller.text, false]);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text("Todo"),
          backgroundColor: Colors.yellow[400],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.yellow,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
