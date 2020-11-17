import 'package:Adventour/models/Place.dart';
import 'package:Adventour/widgets/circle_icon.dart';
import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  Place place;
  Function onTap;
  bool timeVisible;

  PlaceWidget({
    Key key,
    @required this.place,
    this.onTap,
    this.timeVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          SizedBox(height: 50, child: CircleIcon(image: place.type)),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(place.adress),
                if (timeVisible)
                  Text(place.duration.inMinutes.toString() + ' min')
              ],
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
