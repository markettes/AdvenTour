import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

enum SingingCharacter { duration, time }

class _HistoryPageState extends State<HistoryPage> {
//   Widget _myRadioButton({String title, int value, Function onChanged}) {
//   return RadioListTile(
//     value: value,
//     groupValue: _groupValue,
//     onChanged: onChanged,
//     title: Text(title),
//   );
// }
  SingingCharacter _character = SingingCharacter.duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your route history'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                        color: Theme.of(context).primaryColor,
                        height: 100,
                        minWidth: 50,
                        onPressed: () async {
                          final List<DateTime> picked =
                              await DateRagePicker.showDatePicker(
                                  context: context,
                                  initialFirstDate: new DateTime.now(),
                                  initialLastDate: (new DateTime.now())
                                      .add(new Duration(days: 7)),
                                  firstDate: new DateTime(2010),
                                  lastDate: new DateTime(2050));
                          if (picked != null && picked.length == 2) {
                            print(picked);
                          }
                        },
                        child: new Text(
                          "Pick date range",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: const Text('Duration'),
                          leading: Radio(
                            value: SingingCharacter.duration,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Time'),
                          leading: Radio(
                            value: SingingCharacter.time,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
