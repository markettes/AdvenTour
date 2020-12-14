import 'package:Adventour/controllers/my_shared_preferences.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_localizations.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('help')),
      ),
      body: ListView.separated(
          itemCount: 3,
          separatorBuilder: (_, _a) => Divider(
                color: Theme.of(context).primaryColor,
                height: 6.0,
              ),
          itemBuilder: (_, index) {
            switch (index) {
              case 0:
                return FlatButton(
                  height: 45.0,
                  onPressed: () => _showMyDialogs('ABOUT'),
                  child: Text(
                    AppLocalizations.of(context).translate('about'),
                    textScaleFactor: 1.5,
                  ),
                );
                break;
              case 1:
                return FlatButton(
                  height: 45.0,
                  onPressed: () => _showMyDialogs('CONTACT'),
                  child: Text(
                    AppLocalizations.of(context).translate('contact'),
                    textScaleFactor: 1.5,
                  ),
                );
            }
          }),
    );
  }

  Future<void> _showMyDialogs(String dialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        switch (dialog) {
          case 'ABOUT':
            return AboutDialog(
              applicationIcon: ImageIcon(
                AssetImage("assets/logo_adventour.png"),
                size: 20,
              ),
              applicationName: 'Adventour',
              applicationVersion: '0.8.1',
              children: [
                Text(
                  'Developers: \n',
                ),
                Text('Carlos Gálvez Aucejito\n' +
                    'Daniel Herrero Pardo\n' +
                    'Daniel Álvarez Vallejo\n' +
                    'José Angel Perea García\n' +
                    'Diego Roig Hervás\n' +
                    'Alberto Rausell Manchón\n' +
                    'José María Vilanova Aíbar\n' +
                    'Marcos Fernández Pérez')
              ],
            );
          case 'CONTACT':
            return ContactDialog();
        }
      },
    );
  }
}

class ContactDialog extends StatefulWidget {
  @override
  _ContactDialogState createState() => _ContactDialogState();
}

class _ContactDialogState extends State<ContactDialog> {
  String dropdownValue = 'Help';

  Email _email;
  TextEditingController _myTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('contact')),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(AppLocalizations.of(context).translate('reason')),
              DropdownButton(
                items: <String>['Help', 'Suggestions', 'Business']
                    .map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (String value) {
                  setState(() {
                    dropdownValue = value;
                  });
                },
                value: dropdownValue,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 20.0),
          child: Flexible(
            child: TextField(
              controller: _myTextController,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText:
                    AppLocalizations.of(context).translate('writeHere') + '...',
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton.icon(
                icon: Icon(
                  Icons.send,
                ),
                label: Text(
                  AppLocalizations.of(context).translate('send'),
                ),
                color: Theme.of(context).buttonColor,
                onPressed: () async {
                  _email = Email(
                      body: _myTextController.text,
                      subject: dropdownValue.toString(),
                      recipients: ['adventourpin@gmail.com']);
                  await FlutterEmailSender.send(_email);
                }), //TODO mensaje
          ],
        )
      ]),
    );
  }
}
