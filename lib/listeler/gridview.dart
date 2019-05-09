import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      itemCount: 100,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //kaçtane 1 satırda
      itemBuilder: (BuildContext context, int index) {
        return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.green, width: 5, style: BorderStyle.solid),
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  offset: Offset(10.5, 5.0),
                  blurRadius: 20
                )
              ],
              shape: BoxShape.circle,
              color: Colors.blue[100 * (index % 9)],
              gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.blue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            //image: DecorationImage(image: AssetImage("assets/images/deneme.jpg")), images
            //fit:Boxfit.contain vs.
            margin: EdgeInsets.all(20),
            child: Text("GridView Example", textAlign: TextAlign.center));
      },
    );
  }
}

/*
 return GridView.count(
      crossAxisCount: 3,//1 tane satırda kaç tane  olacağı
      scrollDirection: Axis.horizontal, // sütünda yatay sıralar
      primary: false, //efect
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      //sütün arası boşluk
      mainAxisSpacing: 40,
      //satır arası boşlıluk
      children: <Widget>[
        Container(color: Colors.teal.shade200, child: Text("GridView Example",textAlign: TextAlign.center),),
        Container(color: Colors.teal.shade200, child: Text("GridView Example",textAlign: TextAlign.center),),
        Container(color: Colors.teal.shade200, child: Text("GridView Example",textAlign: TextAlign.center),),
        Container(color: Colors.teal.shade200, child: Text("GridView Example",textAlign: TextAlign.center),)
      ],
    );
 */
/*
return GridView.extent(
      maxCrossAxisExtent: 100,//her bir elemana soldan sağa doğru 200 olur genişliği
      scrollDirection: Axis.horizontal, // sütünda yatay sıralar
      primary: false, //efect
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      //sütün arası boşluk
      mainAxisSpacing: 40,
      //satır arası boşlıluk
      children: <Widget>[
        Container(color: Colors.teal.shade200, child: Text("GridView Example",textAlign: TextAlign.center),),
        Container(color: Colors.teal.shade200, child: Text("GridView Example",textAlign: TextAlign.center),),
        Container(color: Colors.teal.shade200, child: Text("GridView Example",textAlign: TextAlign.center),),
        Container(color: Colors.teal.shade200, child: Text("GridView Example",textAlign: TextAlign.center),)
      ],
    );
 */
