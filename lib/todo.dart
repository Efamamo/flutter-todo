// ignore_for_file: prefer_initializing_formals, avoid_init_to_null, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class ToDO extends StatelessWidget {
  String task = '';
  bool completed = false;
  Function(bool?)? onChanged = null;
  // ignore: use_key_in_widget_constructors
  ToDO(task, completed, onChanged) {
    this.task = task;
    this.completed = completed;
    this.onChanged = onChanged;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 100,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Checkbox(
            value: completed,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
          SizedBox(width: 12),
          Text(task,
              style: TextStyle(
                  color: Colors.white,
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none))
        ],
      ),
    );
  }
}
