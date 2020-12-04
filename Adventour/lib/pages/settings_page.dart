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
            Row(
              children: [
                FlatButton(
                  child: Text(
                    AppLocalizations.of(context).translate('changelanguage'),
                  ),
                  onPressed: () => _showMyDialogs(),
                ),
              ],
            ),
            Row(
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context).translate('about')),
                ), //Icono Adventour
              ],
            ),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context).translate('contact'),
                ),
                IconButton(icon: Icon(Icons.contact_support), onPressed: null)
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("language", language);
  }

  Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("language");
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
              applicationVersion: '0.1.7',
              children: [
                Text('Developers:'),
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

class ContactDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(title: Text(AppLocalizations.of(context).translate('contact')), ,),
          ),
          fullscreenDialog: true),
    );
  }
}

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).translate('changelanguage')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context).translate('spanish')),
            leading: Radio(
              value: 1,
              groupValue: 1,
              onChanged: (_) {},
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate('english')),
            leading: Radio(
              value: 0,
              groupValue: 1,
              onChanged: (_) {},
            ),
          ),
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context),
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
