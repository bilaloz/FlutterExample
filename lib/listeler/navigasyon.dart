import 'package:flutter/material.dart';
import 'package:flutter_example/listeler/input_form.dart';

class Navigasyon extends StatelessWidget {
  String baslik = "BNavigator";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Navigator",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Page A Link"),
              color: Colors.deepOrange,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ANavigasyon(),
                    ));
              },
            ),
            RaisedButton(
              child: Text("Page B Link"),
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BNavigasyon(baslik: baslik),
                    ));
              },
            ),
            RaisedButton(
              child: Text("Page c Link"),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CNavigasyon(),
                    ));
              },
            ),
            RaisedButton(
              child: Text("Page D get Data"),
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DNavigasyon()),
                ).then((popThan) {
                  debugPrint("Pop Than $popThan");
                });
              },
            ),
            RaisedButton(
              child: Text("Page A get Data"),
              color: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ENavigasyon()),
                ).then((popThan) {
                  debugPrint("Pop Than $popThan");
                });
              },
            ), RaisedButton(
              child: Text("Form List"),
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context,"/FormIslemleri"
                ).then((popThan) {
                  debugPrint("Pop Than $popThan");
                });
              },
            ), RaisedButton(
              child: Text("Form İnput"),
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context,"/TextFieldIslemleri"
                ).then((popThan) {
                  debugPrint("Pop Than $popThan");
                });
              },
            ),RaisedButton(
              child: Text("Form Diğer"),
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context,"/DigerFormElemanlari"
                ).then((popThan) {
                  debugPrint("Pop Than $popThan");
                });
              },
            ),RaisedButton(
              child: Text("Date Diğer"),
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context,"/TarihAndTime"
                ).then((popThan) {
                  debugPrint("Pop Than $popThan");
                });
              },
            ),RaisedButton(
              child: Text("Date Diğer"),
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context,"/StepperExample"
                ).then((popThan) {
                  debugPrint("Pop Than $popThan");
                });
              },
            ),
          ],
        ),
          )),
    );
  }
}

class ANavigasyon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "A Navigator",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Page A Link"),
            ],
          ),
        ));
  }
}

class BNavigasyon extends StatelessWidget {
  String baslik;

  BNavigasyon({this.baslik});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "B Navigator",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Page A Link"),
            ],
          ),
        ));
  }
}

class CNavigasyon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "C Navigator",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Page C Link"),
              RaisedButton(
                color: Colors.purple,
                child: Text("Geri Dön"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}

class DNavigasyon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () {
          debugPrint("On will pop run");
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "D Navigator",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Page DLink"),
                  RaisedButton(
                    color: Colors.purple,
                    child: Text("Geri Dön"),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  )
                ],
              ),
            )));
  }
}

class ENavigasyon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "E Navigator",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: () {
                Navigator.pushReplacementNamed(context, '/BNavigasyon');
              })
            ],
          ),
        ));
  }
}
