import 'package:flutter/material.dart';
import 'package:flutter_application_3/Utili/DailogBox.dart';
import 'package:flutter_application_3/Utili/ToDoTile.dart';
import 'package:flutter_application_3/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // reference the hive box
  final _mybox = Hive.box('mybox');
  ToDoData db = ToDoData();

  @override
  void initState() {
    // 1st time opening the app
    if (_mybox.get("TODOLIST") == null) {
      db.createInitData();
    }
    // User have some data already there
    else {
      db.loadData();
    }

    super.initState();
  }

  // Text controller
  final _controller = TextEditingController();

  // checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.ToDolist[index][1] = !db.ToDolist[index][1];
    });
    db.updataData();
  }

  // Create New Task
  void CreateNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DailogBox(
            controller: _controller,
            OnSaved: SaveNewTask,
            OnCancel: Navigator.of(context).pop,
          );
        });
    db.updataData();
  }

  // Save New Task
  void SaveNewTask() {
    setState(() {
      db.ToDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Delete Task
  void deleteTask(int index) {
    setState(() {
      db.ToDolist.removeAt(index);
    });
    db.updataData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color.fromRGBO(35, 35, 35, 1),
          appBar: AppBar(
            title: const Text(
              "TO DO",
              style: TextStyle(fontSize: 30),
            ),
            backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
            titleTextStyle:
                const TextStyle(color: Colors.white),
            centerTitle: true,
            toolbarHeight: 100,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(50, 50, 50, 1),
              elevation: 0,
              onPressed: CreateNewTask,
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.red[400],
              )),
          body: ListView.builder(
            itemCount: db.ToDolist.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskname: db.ToDolist[index][0],
                taskcompleted: db.ToDolist[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            },
          )),
    );
  }
}
