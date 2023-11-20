import 'package:hive_flutter/hive_flutter.dart';

class ToDoData {
  List ToDolist = [];

  // Reference the box
  final _mybox = Hive.box('mybox');

  // 1st time opening the app
  void createInitData() {
    ToDolist = [
      ["Do Yoga", false],
      ["Drink Water", false]
    ];
  }

  // load the data from database
  void loadData() {
    ToDolist = _mybox.get("TODOLIST");
  }

  // upadate the data from database
  void updataData() {
    _mybox.put("TODOLIST", ToDolist);
  }
}
