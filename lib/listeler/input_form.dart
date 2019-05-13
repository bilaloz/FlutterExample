import 'package:flutter/material.dart';

class FormIslemleri extends StatefulWidget {
  @override
  _FormIslemleriState createState() => _FormIslemleriState();
}

class _FormIslemleriState extends State<FormIslemleri> {
  String girilenMetin = "";
  FocusNode _focusNode;
  int maxLine = 1;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController = TextEditingController(text: "Default");
    _focusNode.addListener(() {});
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (_focusNode.hasFocus) {
        maxLine = 3;
      } else
        maxLine = 1;
    });

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Form İşlemleri"),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              onPressed: () {
                debugPrint(_textEditingController.text.toString());
              },
              child: Icon(Icons.edit))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              maxLength: 50,
              maxLines: maxLine,
              controller: _textEditingController,
              autofocus: false,
              decoration: InputDecoration(
                hintText: "Metini Buraya Geliniz...",
                labelText: "Başlık",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                icon: Icon(Icons.edit),
                prefix: Icon(Icons.done),
                suffix: Icon(Icons.add),
                filled: false,
                fillColor: Colors.cyan.shade200,
              ),
              keyboardType: TextInputType.number,
              onChanged: (String s) {
                debugPrint("On change $s");
                girilenMetin = s;
              },
              onSubmitted: (String s) {
                debugPrint("On submit $s");
                girilenMetin = s;
              },
              cursorColor: Colors.red,
              textInputAction: TextInputAction.done,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              maxLength: 50,
              autofocus: false,
              maxLines: maxLine,
              decoration: InputDecoration(
                hintText: "Metini Buraya Geliniz...",
                labelText: "Başlık",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                icon: Icon(Icons.edit),
                prefix: Icon(Icons.done),
                suffix: Icon(Icons.add),
                filled: false,
                fillColor: Colors.cyan.shade200,
              ),
              keyboardType: TextInputType.number,
              onChanged: (String s) {
                debugPrint("On change $s");
                girilenMetin = s;
              },
              onSubmitted: (String s) {
                debugPrint("On submit $s");
                girilenMetin = s;
              },
              cursorColor: Colors.red,
              textInputAction: TextInputAction.done,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 300,
            color: Colors.teal,
            child:
                Align(alignment: Alignment.center, child: Text(girilenMetin)),
          ),
        ],
      ),
    );
  }
}
