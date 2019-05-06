import 'package:flutter/material.dart';

class ListeUseas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          child: Card(
            color: Colors.teal.shade100,
            margin: EdgeInsets.all(10),
            elevation: 15,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.supervised_user_circle),
                radius: 12,
              ),
              title: Text("Card Tittle"),
              trailing: Icon(Icons.access_time),
              subtitle: Text("Card Sub Tittle"),
            ),
          ),
        ),
        Divider(
          color: Colors.orange,
          height: 22,
          indent: 20,
        ),
        Container(
          child: Card(
            color: Colors.teal.shade100,
            margin: EdgeInsets.all(10),
            elevation: 15,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.supervised_user_circle),
                radius: 12,
              ),
              title: Text("Card Tittle"),
              trailing: Icon(Icons.access_time),
              subtitle: Text("Card Sub Tittle"),
            ),
          ),
        ),
        Divider(
          color: Colors.orange,
          height: 22,
          indent: 20,
        ),
        Container(
          child: Card(
            color: Colors.teal.shade100,
            margin: EdgeInsets.all(10),
            elevation: 15,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.supervised_user_circle),
                radius: 12,
              ),
              title: Text("Card Tittle"),
              trailing: Icon(Icons.access_time),
              subtitle: Text("Card Sub Tittle"),
            ),
          ),
        ),
        Divider(
          color: Colors.orange,
          height: 22,
          indent: 20,
        ),
        Container(
          child: Card(
            color: Colors.teal.shade100,
            margin: EdgeInsets.all(10),
            elevation: 15,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.supervised_user_circle),
                radius: 12,
              ),
              title: Text("Card Tittle"),
              trailing: Icon(Icons.access_time),
              subtitle: Text("Card Sub Tittle"),
            ),
          ),
        ),
        Divider(
          color: Colors.orange,
          height: 22,
          indent: 20,
        ), Container(
          child: Card(
            color: Colors.teal.shade100,
            margin: EdgeInsets.all(10),
            elevation: 15,
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.supervised_user_circle),
                radius: 12,
              ),
              title: Text("Card Tittle"),
              trailing: Icon(Icons.access_time),
              subtitle: Text("Card Sub Tittle"),
            ),
          ),
        ),
        Divider(color: Colors.orange,height: 22,indent: 20,)
      ],
    ));
  }
}
