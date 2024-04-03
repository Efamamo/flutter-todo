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

  void onChanged(bool? value, int index) {
    setState(() {
      values[index][1] = !values[index][1];
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
    );
  }
}
