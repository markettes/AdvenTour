import 'package:Adventour/controllers/directions_engine.dart';
import 'package:Adventour/models/Place.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  CircleIcon({
    @required this.image,
  });

  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Theme.of(context).primaryColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.network(image,color: Colors.white,),
      ),
    );
  }

  IconData toIcon(String type) {
    switch (type) {
      case CAR:
        return Icons.directions_car;
      case WALK:
        return Icons.directions_walk;
      case BICYCLE:
        return Icons.directions_bike;
      case PUBLIC:
        return Icons.directions_subway;
      case "park":
        return Icons.park;
      case "church":
        return Icons.history_edu;
      case "restaurant":
        return Icons.restaurant;
      case "city_hall":
        return Icons.house_outlined;
      case BAR:
        return Icons.sports_bar;
      case "tourist_attraction":
        return Icons.camera_alt;
      case CAFE:
        return Icons.local_cafe;
      case COURTHOUSE:
        return Icons.gavel;
      case "library":
        return Icons.local_library;
      case MOSQUE:
        return Icons.location_city;
      case "movie_theater":
        return Icons.theater_comedy;
      case "stadium":
        return Icons.sports;
      case "art_gallery":
        return Icons.museum;
      case "night_club":
        return Icons.nightlife;
      case "shopping_mall":
        return Icons.local_mall;
      default:
        throw Exception('Icon not available');
    }
  }
}