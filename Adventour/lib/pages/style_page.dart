import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/square_icon_button.dart';
import 'package:flutter/material.dart';

import '../app_localizations.dart';

class StylePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hola mundo',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
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
                  text: AppLocalizations.of(context).translate('HIGHLIGHTS') ,
                  onPressed: () {},
                  icon: Icons.star,
                ),
                PrimaryButton(
                  text: AppLocalizations.of(context).translate('CUSTOM') ,
                  onPressed: () {},
                  style: ButtonType.Void,
                  icon: Icons.edit,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     CircleIconButton(
                //       type: CircleIconButtonType.Food,
                //       onPressed: () {},
                //     ),
                //     CircleIconButton(
                //       type: CircleIconButtonType.Museum,
                //       onPressed: () {},
                //     ),
                //   ],
                // ),
                // InputText(
                //   obscured: false,
                //   icon: Icons.location_on,
                //   labelText: 'Location',
                // ),
                SquareIconButton(
                  icon: Icons.map,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/map');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}