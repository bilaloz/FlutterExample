import 'package:flutter/material.dart';
import 'package:flutter_example/listeler/custom_scrool.dart';
import 'package:flutter_example/listeler/form_input.dart';
import 'package:flutter_example/listeler/gridview.dart';
import 'package:flutter_example/listeler/input_form.dart';
import 'package:flutter_example/listeler/list.dart';
import 'package:flutter_example/listeler/list_type.dart';
import 'package:flutter_example/listeler/navigasyon.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Example ',
    debugShowCheckedModeBanner: false,
    routes: {
      '/'     :(context) => Navigasyon(),
      '/CPage':(context) => DNavigasyon(),
      '/DPage':(context) => DNavigasyon(),
      '/APage':(context) => DNavigasyon(),
      '/FormIslemleri':(context) => FormIslemleri(),
      '/TextFieldIslemleri':(context) => TextFieldIslemleri(),
    },
    theme: ThemeData(primarySwatch: Colors.orange,
      //brightness: Brightness.light,
    ),
    //home: Scaffold(
    //  //appBar: AppBar(
    //  //title: Text("Listeler",style:TextStyle(color: Colors.black),),
    //  //),
    //  body: Navigasyon(),
    //),
  ));
}
