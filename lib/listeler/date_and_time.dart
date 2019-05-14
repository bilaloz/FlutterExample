import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class TarihAndTime extends StatefulWidget {
  @override
  _TarihAndTimeState createState() => _TarihAndTimeState();
}

class _TarihAndTimeState extends State<TarihAndTime> {
  DateTime selectDates;

  @override
  Widget build(BuildContext context) {

    DateTime current = DateTime.now();
    DateTime ucAyOncesi = DateTime(2019,current.month-3);
    DateTime yirmiGunSonrasi= DateTime(2019,current.month,current.day+20);
    TimeOfDay currentTime = TimeOfDay.now();

    return Scaffold(
      appBar:AppBar(
        title: Text("Date time picker"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                showDatePicker(context: context, initialDate: current, firstDate: ucAyOncesi, lastDate: yirmiGunSonrasi).then((selectDate){
                  setState(() {
                    debugPrint(selectDate.toString());
                    debugPrint(selectDate.toIso8601String());
                    debugPrint(selectDate.toLocal().toString());
                    debugPrint(selectDate.timeZoneName.toString());
                    debugPrint(selectDate.timeZoneOffset.toString());
                    debugPrint(selectDate.millisecond.toString());
                    debugPrint(selectDate.millisecondsSinceEpoch.toString());
                    selectDates = selectDate;
                    debugPrint(selectDates.day.toString());

                    debugPrint(formatDate(selectDates,[yyyy,'- ', mm,'-',dd]));

                  });
                });
              },
              color: Colors.green,
              child: Text("Tarih Seç"),
            ),
            RaisedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: currentTime).then((selecTime){
                  debugPrint(selecTime.format(context));
                  debugPrint(selecTime.hour.toString());
                });
              },
              color: Colors.yellow,
              child: Text("Saat Seç"),
            ),
            Text(selectDates!=null ?"${selectDates.year.toString()}+${selectDates.month.toString()}+${selectDates.day.toString()}":"",
            )
          ],
        ),
      ),
    );
  }
}
