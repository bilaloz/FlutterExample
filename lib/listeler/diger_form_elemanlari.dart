import 'package:flutter/material.dart';
class DigerFormElemanlari extends StatefulWidget {
  @override
  _DigerFormElemanlariState createState() => _DigerFormElemanlariState();
}

class _DigerFormElemanlariState extends State<DigerFormElemanlari> {
  bool _checkBoxSelected = false;
  String _city = "";
  bool _switchState = false;
  double _sliderValue = 10;
  String _colorSelected = "Kırmızı";
  List<String> _citys = ["İstanbul", "Ankara", "İzmir"];
  String currentCitys = "Ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_circle),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              CheckboxListTile(
                  value: _checkBoxSelected,
                  title: Text("Checkbox title"),
                  subtitle: Text("Checkbox Subtitle"),
                  activeColor: Colors.red,
                  secondary: Icon(Icons.add),
                  onChanged: (selected) {
                    setState(() {
                      _checkBoxSelected = selected;
                    });
                  }),
              RadioListTile<String>(
                  value: "Ankara",
                  groupValue: _city,
                  title: Text("Ankara"),
                  secondary: Icon(Icons.mail),
                  subtitle: Text("Imamoğlu"),
                  onChanged: (data) {
                    setState(() {
                      _city = data;
                      debugPrint("Bir deger $data");
                    });
                  }),
              RadioListTile<String>(
                  value: "İzmir",
                  groupValue: _city,
                  title: Text("İzmir"),
                  secondary: Icon(Icons.mail),
                  subtitle: Text("Imamoğlu"),
                  onChanged: (data) {
                    setState(() {
                      _city = data;
                      debugPrint("İki deger $data");
                    });
                  }),
              RadioListTile<String>(
                  value: "İstanbul",
                  groupValue: _city,
                  title: Text("İstanbul"),
                  secondary: Icon(Icons.mail),
                  subtitle: Text("Imamoğlu"),
                  onChanged: (data) {
                    setState(() {
                      _city = data;
                      debugPrint("Üç deger $data");
                    });
                  }),
              SwitchListTile(
                  value: _switchState,
                  title: Text("Switch"),
                  subtitle: Text("Switch subtitle"),
                  secondary: Icon(Icons.refresh),
                  onChanged: (data) {
                    setState(() {
                      debugPrint("Anlasma $data");
                      _switchState = data;
                    });
                  }),
              Text("Değeri sliderden seçiniz"),
              Slider(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
                min: 10,
                max: 20,
                label: _sliderValue.toString(),
                divisions: 10,
              ),
              DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 12,
                          height: 12,
                          color: Colors.red,
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text("Kırmızı"),
                      ],
                    ),
                    value: "Kırmızı",
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 12,
                          height: 12,
                          color: Colors.orange,
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text("Turuncu"),
                      ],
                    ),
                    value: "Turuncu",
                  ),
                  DropdownMenuItem<String>(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 12,
                          height: 12,
                          color: Colors.blue,
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text("Mavi"),
                      ],
                    ),
                    value: "Mavi",
                  ),
                ],
                onChanged: (selected) {
                  setState(() {
                    _colorSelected = selected;
                  });
                },
                hint: Text("Secildi"),
                value: _colorSelected,
              ),
              DropdownButton<String>(
                items: _citys.map((currentCity) {
                  return DropdownMenuItem<String>(
                    child: Text(currentCity),
                    value: currentCity,
                  );
                }).toList(),
                onChanged: (s){
                  setState(() {
                    currentCitys = s ;
                  });
                },
                value: currentCitys,
              )
            ],
          ),
        ));
  }
}
