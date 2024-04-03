import 'dart:convert';

import 'package:flutter/material.dart';
import 'todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List values = [
    ["Study Flutter", false],
    ["Solve leetcode", false],
    ["Do Assignments", false]
  ];

  TextEditingController taskController = TextEditingController();
  void onChanged(bool? value, int index) {
    setState(() {
      values[index][1] = !values[index][1];
    });
  }

  void create() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
              width: 200,
              height: 200,
              color: Colors.blue[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: taskController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter a new task"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              values.add([taskController.text, false]);
                              Navigator.pop(context);
                              taskController.clear();
                            });
                          },
                          child: Text("Save"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green)),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Text("Cancel"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red)),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: values.length,
          itemBuilder: (context, index) {
            return ToDO(values[index][0], values[index][1],
                (value) => onChanged(value, index));
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: create,
          backgroundColor: Colors.blue,
          tooltip: "Add a new task",
          child: Icon(Icons.add, color: Colors.white)),
    );
  }
}
