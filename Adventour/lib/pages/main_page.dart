import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/site_icon.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hola mundo',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
            child: Column(
          children: [
            Text(
              'Hola mundo',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'Hola mundo',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Hola mundo',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            PrimaryButton(
              text: 'LOG IN',
              onPressed: () {},
            ),
            PrimaryButton(
                text: 'LOG OUT', onPressed: () {}, style: ButtonType.Void),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SiteIcon(
                  type: SiteIconType.Food,
                ),
                SiteIcon(
                  type: SiteIconType.Museum,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
