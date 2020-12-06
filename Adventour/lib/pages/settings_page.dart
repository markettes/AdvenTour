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
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              color: Theme.of(context).buttonColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    child: Text(
                      AppLocalizations.of(context).translate('changelanguage'),
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () => _showMyDialogs('LANG'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              color: Theme.of(context).buttonColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () => _showMyDialogs('ABOUT'),
                    child: Text(
                      AppLocalizations.of(context).translate('about'),
                      textScaleFactor: 1.5,
                    ),
                  ), //Icono Adventour
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              color: Theme.of(context).buttonColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () => _showMyDialogs('CONTACT'),
                    child: Text(
                      AppLocalizations.of(context).translate('contact'),
                      textScaleFactor: 1.5,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialogs(String dialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        switch (dialog) {
          case 'LANG':
            return LanguageDialog();
          case 'ABOUT':
            return AboutDialog(
              applicationIcon: Image.asset('logo_adventour.png'),
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
                onPressed: () {}), //TODO
          ],
        )
      ]),
    );
  }
}

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({
    Key key,
  }) : super(key: key);

  static Future<bool> setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("language", language);
  }

  static Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("language");
  }

  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  Locale locale;
  @override
  Widget build(BuildContext context) {
    String currentLanguage;
    LanguageDialog.getLanguage().then((value) => currentLanguage = value);
    return AlertDialog(
      title: Text(AppLocalizations.of(context).translate('changelanguage')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<String>(
            future: LanguageDialog.getLanguage(),
            initialData: 'lang/en.json',
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return snapshot.hasData
                  ? () => {
                        ListTile(
                          title: Text(AppLocalizations.of(context)
                              .translate('spanish')),
                          leading: Radio(
                            value: 'lang/es.json',
                            groupValue: currentLanguage,
                            onChanged: (String value) {
                              currentLanguage = value;
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(AppLocalizations.of(context)
                              .translate('english')),
                          leading: Radio(
                            value: 'lang/en.json',
                            groupValue: currentLanguage,
                            onChanged: (String value) {
                              currentLanguage = value;
                            },
                          ),
                        ),
                      }
                  : Container();
            },
          ),
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () => {
            LanguageDialog.setLanguage(currentLanguage),
            setState(() {}),
            Navigator.pop(context)
          },
          child: Text(AppLocalizations.of(context).translate('save')),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context).translate('cancel')),
        ),
      ],
    );
  }
}
