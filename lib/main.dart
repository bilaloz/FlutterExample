import 'package:flutter/material.dart';
import 'package:flutter_example/listeler/custom_scrool.dart';
import 'package:flutter_example/listeler/gridview.dart';
import 'package:flutter_example/listeler/list.dart';
import 'package:flutter_example/listeler/list_type.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Example ',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.orange,
      //brightness: Brightness.light,
    ),
    home: Scaffold(
      //appBar: AppBar(
      //title: Text("Listeler",style:TextStyle(color: Colors.black),),
      //),
      body: CustomScrool(),
    ),
  ));
}
