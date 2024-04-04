// ignore_for_file: prefer_initializing_formals, avoid_init_to_null, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class ToDO extends StatelessWidget {
  String task = '';
  bool completed = false;
  Function(bool?)? onChanged = null;
  void Function()? delete = null;
  // ignore: use_key_in_widget_constructors
  ToDO(task, completed, onChanged, delete) {
    this.task = task;
    this.completed = completed;
    this.onChanged = onChanged;
    this.delete = delete;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 80,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: completed,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
          Text(task,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: delete,
          )
        ],
      ),
    );
  }
}
