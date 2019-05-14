import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StepperExample extends StatefulWidget {
  @override
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _currentStep = 0;
  int _tcNo;
  String _userMail, _userPass, _userPassRepeat, _userName;
  List<Step> _allStep;
  bool _error = false;

  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  var key3 = GlobalKey<FormFieldState>();
  var key4 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _allStep = _allSteps();
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.green,
        accentColor: Colors.teal.shade400,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kullanıcı Kayıt Ekranı"),
        ),
        body: SingleChildScrollView(
          child: Stepper(
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: onStepContinue,
                    color: Colors.green,
                    child: const Text('Devam'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    onPressed: onStepCancel,
                    color: Colors.deepOrange,
                    child: const Text('Geri'),
                  ),
                ],
              );
            },
            steps: _allStep,
            currentStep: _currentStep,
            onStepTapped: (clickStep) {
              setState(() {
                _currentStep = clickStep;
              });
            },
            onStepContinue: () {
              setState(() {
                nextButtonControls();
              });
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep > 0) {
                  _currentStep--;
                  _error = false;
                }
              });
            },
          ),
        ),
      ),
    );
  }

  List<Step> _allSteps() {
    List<Step> steps = [
      Step(
        title: Text("TC Kimlik Numaranızı Giriniz"),
        subtitle: Text(
          "** Minimum 11 haneli olmalı",
        ),
        state: stateConfig(0),
        isActive: true,
        content: Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            key: key0,
            autofocus: true,
            onSaved: (saved) => _tcNo = int.parse(saved),
            validator: ((inputValue) {
              return inputValue.length < 11
                  ? "En az 11 karekter girmelisiniz"
                  : null;
            }),
            keyboardType: TextInputType.number,
            maxLength: 11,
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                labelText: "TC-No",
                hintText: "TC Kimlik Numaranızı Giriniz",
                border: OutlineInputBorder()),
          ),
        ),
      ),
      Step(
        title: Text("Mail Adresinizi Giriniz"),
        subtitle: Text(
          "** Lütfen geçerli bir mail adresi giriniz.",
        ),
        state: stateConfig(1),
        isActive: true,
        content: Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            key: key1,
            onSaved: (saved) => _userMail = saved,
            validator: ((inputEmail) => _emailValidator(inputEmail)),
            decoration: InputDecoration(
                labelText: "E-mail",
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                hintText: "E-mail adresinizi giriniz",
                border: OutlineInputBorder()),
          ),
        ),
      ),
      Step(
        title: Text("Adınızı Giriniz"),
        subtitle: Text(
          "** Lütfen adınızı doğru giriniz (Türkçe Harf Kullanmayınız).",
        ),
        state: stateConfig(2),
        isActive: true,
        content: Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            key: key2,
            onSaved: (saved) => _userName = saved,
            validator: (name) => _nameValidator(name),
            decoration: InputDecoration(
                labelText: "İsim",
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                hintText: "Lütfen adınızı giriniz.",
                border: OutlineInputBorder()),
          ),
        ),
      ),
      Step(
        title: Text("Şifre Giriniz"),
        subtitle: Text(
          "** Minimum 6 haneden oluşmalıdır şifreler eşleşmelidir.",
        ),
        state: stateConfig(3),
        isActive: true,
        content: Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            key: key3,
            validator: (pass) {
              return pass.length < 6 ? "En az 6 karekterli" : null;
            },
            onSaved: (saved) => _userPass,
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                labelText: "Şifre",
                hintText: "Lütfen şifrenizi giriniz",
                border: OutlineInputBorder()),
          ),
        ),
      ),
      Step(
        title: Text("Şifreyi Tekrar Giriniz"),
        subtitle: Text(
          "** Minimum 6 haneden oluşmalıdır şifreler eşleşmelidir.",
        ),
        state: stateConfig(4),
        isActive: true,
        content: Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            key: key4,
            validator: (pass) {
              if (pass.length > 6) {
                return !identical(pass, _userPass)
                    ? "Şifreler eşleşmiyor"
                    : null;
              }
              return pass.length < 6 ? "En az 6 karekterli" : null;
            },
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                labelText: "Şifre",
                hintText: "Lütfen şifrenizi giriniz",
                border: OutlineInputBorder()),
          ),
        ),
      ),
    ];
    return steps;
  }

  String _emailValidator(String mail) {
    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(mail);
    return emailValid ? null : "Geçerli mail adresi giriniz";
  }

  String _nameValidator(String name) {
    bool nameValid = RegExp('[a-zA-Z]').hasMatch(name);
    return nameValid ? null : "Geçerli isim giriniz";
  }

  StepState stateConfig(int i) {

    if (_currentStep == i) {
      if (_error) return StepState.error;
      return StepState.editing;
    }
    else if (_currentStep > i)
      return StepState.complete;
    else
      return StepState.disabled;
  }

  void nextButtonControls() {
    _error = false;
    switch (_currentStep) {
      case 0:
        if (key0.currentState.validate()) {
          key0.currentState.save();
          _currentStep++;
        } else
          _error = true;
        break;
      case 1:
        if (key1.currentState.validate()) {
          key1.currentState.save();
          _currentStep++;
        } else
          _error = true;
        break;
      case 2:
        if (key2.currentState.validate()) {
          key2.currentState.save();
          _currentStep++;
        } else
          _error = true;
        break;
      case 3:
        if (key3.currentState.validate()) {
          _currentStep++;
          key3.currentState.save();
        } else
          _error = true;
        break;
      case 4:
        if (key4.currentState.validate()) {
          _currentStep = 4;
          key4.currentState.save();
          Fluttertoast.showToast(msg: "Başarılı bir şekilde kayıt oldunuz.");
        } else
          _error = true;
        break;
    }
  }
}
