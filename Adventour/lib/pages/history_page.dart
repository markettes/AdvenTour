import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/FinishedRoute.dart';
import 'package:Adventour/widgets/finished_widget.dart';
import 'package:Adventour/widgets/route_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

import '../app_localizations.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime _initialDateTime = DateTime(2020);
  DateTime _finishDateTime = DateTime.now();
  DateTime _now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String _formatedInitialDateTime = formatDate(_initialDateTime);
    String _formatedFinishDateTime = formatDate(_finishDateTime);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('h_route')),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(_formatedInitialDateTime != _formatedFinishDateTime
              ? _formatedInitialDateTime + ' - ' + _formatedFinishDateTime
              : _formatedInitialDateTime),
          SizedBox(
            width: 8,
          ),
          RawMaterialButton(
            onPressed: () async {
              final List<DateTime> picked = await DateRagePicker.showDatePicker(
                context: context,
                initialFirstDate: _initialDateTime,
                initialLastDate: _finishDateTime,
                firstDate: DateTime(2020),
                lastDate: DateTime(
                    _now.year, _now.month, _now.day, 23, 59, 59, 99, 99),
              );
              if (picked != null && picked.length == 2) {
                _initialDateTime = picked.first;
                _finishDateTime =
                    picked[1].add(Duration(hours: 23, minutes: 59));
              } else {
                _initialDateTime = picked.first;
                _finishDateTime =
                    picked.first.add(Duration(hours: 23, minutes: 59));
              }
              setState(() {});
              print('?' +
                  _initialDateTime.toString() +
                  '    ' +
                  _finishDateTime.toString());
            },
            elevation: 2.0,
            fillColor: Theme.of(context).primaryColor,
            constraints: BoxConstraints(minWidth: 0),
            child: Icon(
              Icons.today,
              size: 30,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            shape: CircleBorder(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: StreamBuilder(
            stream: db.getUserHistory(
                db.currentUserId, _initialDateTime, _finishDateTime),
            builder: (context, snapshot) {
              if (snapshot.hasError) print('error');
              if (!snapshot.hasData) return CircularProgressIndicator();
              List<FinishedRoute> routes = snapshot.data;
              if (routes.isEmpty)
                return Center(child: Text(AppLocalizations.of(context).translate('no_route')));
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: routes.length,
                  itemBuilder: (context, index) {
                    FinishedRoute route = routes[index];
                    print('?' + route.name);
                    return FinishedWidget(
                      route: route,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 5),
                ),
              );
            }),
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    String day, month, year;
    day = dateTime.day.toString();
    month = dateTime.month.toString();
    year = dateTime.year.toString();
    return day + '/' + month + '/' + year.substring(2);
  }
}
