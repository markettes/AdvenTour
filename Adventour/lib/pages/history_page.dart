import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/widgets/route_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

enum SingingCharacter { duration, time }

class _HistoryPageState extends State<HistoryPage> {
  SingingCharacter _character = SingingCharacter.duration;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your route history'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: MaterialButton(
                        color: Theme.of(context).primaryColor,
                        height: 50,
                        minWidth: 20,
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
                        child: new Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                        )),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 50,
                      height: 150,
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
                    ),
                  )
                ],
              )),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          child: StreamBuilder(
                              stream: db.getRoutes(db.currentUserId),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) print('error');
                                if (!snapshot.hasData){
                                  return CircularProgressIndicator();
                                }
                                List<Route> routes = snapshot.data;
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView(
                                    children: [
                                      RouteWidget()
                                      ],
                                  ),
                                );
                              }),
                          width: 150,
                          height: 600,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  bool betweenDates(DateTime fromDate, DateTime toDate, DateTime evaluate) {
    return fromDate.compareTo(evaluate) <= 0 &&
    toDate.compareTo(evaluate) >= 0;
  }
}
