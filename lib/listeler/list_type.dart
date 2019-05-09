import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
        itemCount: 40,
        itemBuilder: (context, index) {
          return Card(
            color:
                index % 2 == 0 ? Colors.red.shade200 : Colors.orange.shade400,
            elevation: 4,
            child: ListTile(
              onTap: () {
                ToastShow(index);
                AlertShow(context, index);
              },
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

  void ToastShow(int index) {
    Fluttertoast.showToast(msg: "$index",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        fontSize: 15);
  }

  void AlertShow(BuildContext context
      , int index) {
    showDialog(context: context, barrierDismissible: false, builder: (context) {
      return AlertDialog(
        title: Text("Alert Dialog Tittle"),
        content: SingleChildScrollView(
            child: ListBody(children: <Widget>[
              Text("Text ${allStudent[index]}"),
            ],)
        ),
        actions: <Widget>[
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text("Tamam"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("Hayır"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          )
        ],
      );
    });
  }
}

class Student {
  String _name;
  String _surName;
  String _school;

  Student(this._name, this._school, this._surName);

  @override
  String toString() {
    return "Selecter $_name  $_surName  $_school";
  }
}
