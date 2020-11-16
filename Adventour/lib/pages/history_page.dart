import 'package:Adventour/widgets/circle_icon.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // DateTime dateTimeStart;
  // DateTime dateTimeEnd;

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
                child: MaterialButton(
                    color: Colors.deepPurple[600],
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
                    ))),
          ],
        ),
      ),
    );
  }
}
