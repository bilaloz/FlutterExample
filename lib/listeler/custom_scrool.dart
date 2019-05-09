import 'dart:math' as Matematik;

import 'package:flutter/material.dart';

class CustomScrool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Sliver App Bar"),
          backgroundColor: Colors.red,
          expandedHeight: 250,
          floating: true,
          centerTitle: true,
          pinned: true,
          snap: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset("assets/images/images.jpg"),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(1),
          sliver: SliverList(
            delegate: SliverChildListDelegate(constListElement()),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(2),
          sliver: SliverList(
            delegate:
                SliverChildBuilderDelegate(_dinemicElementFonk, childCount: 6),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(3),
          sliver: SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(_dinemicElementFonk,
                  childCount: 6),
              itemExtent: 100),
        ),
        SliverPadding(
          padding: EdgeInsets.all(3),
          sliver: SliverFixedExtentList(
            delegate: SliverChildListDelegate(constListElement()),
            itemExtent: 50,
          ),
        ),
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate:
              SliverChildBuilderDelegate(_dinemicElementFonk, childCount: 6),
        )
      ],
    );
  }

  List<Widget> constListElement() {
    return [
      Container(
        height: 120,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text(
          "Custom Scroll",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 120,
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text(
          "Custom Scroll",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 120,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          "Custom Scroll",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 120,
        color: Colors.deepOrange,
        alignment: Alignment.center,
        child: Text(
          "Custom Scroll",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 120,
        color: Colors.cyan,
        alignment: Alignment.center,
        child: Text(
          "Custom Scroll",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 120,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "Custom Scroll",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }

  Widget _dinemicElementFonk(BuildContext context, int index) {
    return Container(
      height: 120,
      color: _randomColors(),
      alignment: Alignment.center,
      child: Text(
        "Dinamik $index ",
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Color _randomColors() {
    return Color.fromARGB(
        Matematik.Random().nextInt(255),
        Matematik.Random().nextInt(250),
        Matematik.Random().nextInt(250),
        Matematik.Random().nextInt(250));
  }
}
