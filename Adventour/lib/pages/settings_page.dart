import 'package:Adventour/controllers/my_shared_preferences.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';
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
        title: Text(AppLocalizations.of(context).translate('settings')),
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
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('changelanguage'),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                            textScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      LanguageButton()
                    ],
                  ),
                );
                break;
              case 1:
                return FlatButton(
                  height: 45.0,
                  onPressed: () => _showMyDialogs('ABOUT'),
                  child: Text(
                    AppLocalizations.of(context).translate('about'),
                    textScaleFactor: 1.5,
                  ),
                );
                break;
              case 2:
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

class LanguageButton extends StatefulWidget {
  const LanguageButton({
    Key key,
  }) : super(key: key);

  @override
  _LanguageButtonState createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  MySharedPreferences _myPrefs = MySharedPreferences();
  String lanCode;
  // switch(lanCode){
  //   case 'en':
  //     return AppLocalizations.of(context).translate('english');
  //   case 'es':
  //     return AppLocalizations.of(context).translate('spanish');
  // }

  List<String> languages = ['English', 'Spanish'];
  String dropdownValue = 'English';

  Future<String> lang() async {
    _myPrefs.initPreferences();
    lanCode = await _myPrefs.myLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: DropdownButton(
          value: dropdownValue,
          underline: Container(
            height: 2,
            color: Theme.of(context).primaryColor,
          ),
          iconEnabledColor: Theme.of(context).primaryColor,
          dropdownColor: Theme.of(context).accentColor,
          items: <String>['English', 'Español']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              switch (newValue) {
                case 'English':
                case 'Inglés':
                  return _myPrefs.myLanguage = 'en';
                case 'Spanish':
                case 'Español':
                  return _myPrefs.myLanguage = 'en';
                default:
                  return '';
              }
            });
          },
        ),
      ),
    );
  }
}

class ContactDialog extends StatefulWidget {
  @override
  _ContactDialogState createState() => _ContactDialogState();
}

class _ContactDialogState extends State<ContactDialog> {
  String dropdownValue = 'Help';
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
                onPressed: () {}), //TODO mensaje
          ],
        )
      ]),
    );
  }
}
