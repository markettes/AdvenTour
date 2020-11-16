import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime newDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your route history'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 75,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime(2000, 1, 1),
                        onDateTimeChanged: (DateTime newDateTime) {
                          this.newDateTime = newDateTime;
                        },
                      ),
                    ),
                  ),
                  //  Expanded(
                  //    child: CircleIcon(image: )
                  //  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
