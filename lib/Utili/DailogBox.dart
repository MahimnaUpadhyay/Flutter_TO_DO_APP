import 'package:flutter/material.dart';
import 'package:flutter_application_3/Utili/mybutton.dart';

// ignore: must_be_immutable
class DailogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback OnSaved;
  VoidCallback OnCancel;
  DailogBox({super.key, required this.controller, required this.OnSaved, required this.OnCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(35,35,35,1),    
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add New Task",
                  hintStyle: TextStyle(fontSize: 15, color: Colors.white)),
              style: const TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Save Button
                MyButton(text: "Save", onPressed: OnSaved),

                // Cancel Button
                MyButton(text: "Cancel", onPressed: OnCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
