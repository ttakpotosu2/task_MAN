import 'package:hive/hive.dart';

class TodoDataBase {

  List todoList = [];

  final _todoBox = Hive.box('todoBox');

  void createInitialData(){
    todoList = [
      ["Add first Task1", false]
    ];
  }

  void loadData(){
    todoList = _todoBox.get("TODOLIST");
  }

  void updateData(){
    _todoBox.put("TODOLIST", todoList);
  }
}