import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(display1: TextStyle(fontSize: 44))),
      title: 'Material App Tittle',
      home: MyHomePage(
        tittle: "My Home",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String tittle = "My Home Page";
  int counts = 0;

  MyHomePage({this.tittle});

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tittle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count();
          });
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Arttır"),
              color: Colors.yellow,
              onPressed: () => _sayacDegeriniAzalt(),
            ),
            Text("Butona Basılma Sayısı"),
            Text("${widget.counts} kere",
                style: Theme.of(context).textTheme.display1.copyWith(
                    color: widget.counts < 0 ? Colors.red : Colors.green)),
            RaisedButton(
              child: Text("Azalt"),
              color: Colors.green,
              onPressed: () => _sayacDegeriniAzalt(),
            )
          ],
        ),
      ),
    );
  }

  void _count() => widget.counts++;

  void _sayacDegeriniAzalt() {
    setState(() {
      widget.counts--;
    });
  }
}
