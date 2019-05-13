import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  @override
  _TextFieldIslemleriState createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  String _nameSurname, _password, _email;
  final formKey = GlobalKey<FormState>();
  bool otoController = false ;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.teal,
            accentColor: Colors.teal.shade400),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Form ve TextFormField"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.save),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formKey,
                autovalidate: otoController,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    TextFormField(
                      validator: (String data) {
                        return data.length < 6 ? "Ad soyad giriniz" : null;
                      },
                      onSaved: (value)=>_nameSurname = value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        hintText: "Name and surname",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        labelText: "Name-Surname",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (String data )=>_emailValidator(data),
                      onSaved: (value)=>_email = value,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "E-Mail",
                        labelText: "E-mail",
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        border: (OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (String data) {
                        return data.length<6 ? "Girilen Değer" : null;
                      },
                      onSaved: (value)=>_password = value,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open),
                        hintText: "Şifre",
                        labelText: "Şifre",
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton.icon(
                        onPressed: () {
                          _loginVerify();
                        },
                        color: Colors.teal.shade200,
                        icon: Icon(Icons.save),
                        label: Text("Kaydet"))
                  ],
                )),
          ),
        ));
  }

  void _loginVerify() {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      debugPrint("girilen mail $_email $_password $_nameSurname");
    }
    else{
      setState(() {
        otoController=true;
      });
    }
  }

  String _emailValidator(String mail) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(mail);
    return emailValid ? null : "Enter valid name" ;
  }
}
