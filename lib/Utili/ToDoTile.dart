// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskname,
      required this.taskcompleted,
      required this.onChanged, 
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 43, 43, 43),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [

              // Check Box 

              Checkbox(
                value: taskcompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              // Task Name
              
              Text(
                taskname,
                style: TextStyle(
                    decoration: taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 3,
                    decorationColor: Colors.red[400],
                    fontSize: 20,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
