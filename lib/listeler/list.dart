import 'package:flutter/material.dart';

class ListeUseas extends StatelessWidget {
  List<int> listSize = List.generate(300, (index) => index);
  List<String> listSubs = List.generate(300, (index) => "List Elemanı $index");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: listSize
            .map(
                (currentItem) => Column(
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
                        title: Text("O anki eleman $currentItem"),
                        trailing: Icon(Icons.access_time),
                        subtitle: Text(listSubs[currentItem]),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.orange,
                    height: 22,
                    indent: 20,
                  ),
                ]))
            .toList());
  }
}
