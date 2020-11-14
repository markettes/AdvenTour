import 'package:Adventour/models/Place.dart';
import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

class PlaceTypesList extends StatelessWidget {
  PlaceTypesList({
    @required this.onTap,
    @required this.selectedTypes
  });

  List<String> selectedTypes;
  Function(String placeType, bool activated) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: placeTypes.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(width: 5),
      itemBuilder: (context, index) {
        bool activated = selectedTypes.contains(placeTypes[index]);
        return CircleIconButton(
            activated: activated,
            type: placeTypes[index],
            onPressed: () => onTap(placeTypes[index], activated));
      },
    );
  }
}
