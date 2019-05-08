import 'package:flutter/material.dart';

class ListEtkin extends StatelessWidget {
  List<Student> allStudent = [];

  @override
  Widget build(BuildContext context) {
    getStudent();

    return ListView.separated(
        separatorBuilder: (context, index) {
          if (index % 5 == 0) {
            return Container(
              color: Colors.blue,
              margin: EdgeInsets.all(5),
              height: 4,
            );
          }
          else
            return Container(
            );
        },
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            color:
                index % 2 == 0 ? Colors.red.shade200 : Colors.orange.shade400,
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.access_time),
              title: Text(allStudent[index]._name),
              subtitle: Text(allStudent[index]._surName),
              trailing: Icon(Icons.accessibility),
            ),
          );
        });
  }

  void getStudent() {
    allStudent = List.generate(
        300,
        (index) => Student("Student $index Name", "Student $index school",
            "Student $index surname"));
  }
}

class Student {
  String _name;
  String _surName;
  String _school;

  Student(this._name, this._school, this._surName);
}
