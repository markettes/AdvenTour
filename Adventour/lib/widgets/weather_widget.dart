import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget({@required this.position});
  Position position;

  DateTime _today = DateTime.now();
  WeatherFactory _ws = WeatherFactory("6dfa830bb9af38b050628b6fd2701df6");
  List<Weather> _forecasts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: IconButton(
          icon: Icon(
            Icons.wb_sunny,
            size: 30,
          ),
          onPressed: () async {
            await _weatherIn();
            _showWeatherDialog(context);
          }),
    );
  }

  String fiveNextDays(int day) {
    if (day > 7) {
      day = day - 7;
    }
    if (day == 1) {
      return "Monday";
    } else if (day == 2) {
      return "Tuesday";
    } else if (day == 3) {
      return "Wednesday";
    } else if (day == 4) {
      return "Thursday";
    } else if (day == 5) {
      return "Friday";
    } else if (day == 6) {
      return "Saturday";
    } else if (day == 7) {
      return "Sunday";
    }
    return null;
  }

  Future<void> _weatherIn() async {
    _forecasts = await _ws.fiveDayForecastByLocation(
        position.latitude, position.longitude);
  }

  IconData _descriptionToIcon(String icon) {
    if (icon == "01n" || icon == "01d") {
      return Icons.wb_sunny;
    } else if (icon == "02n" || icon == "02d") {
      return Icons.wb_cloudy_outlined;
    } else if (icon == "03n" || icon == "03d") {
      return Icons.wb_cloudy;
    } else if (icon == "04n" || icon == "04d") {
      return Icons.wb_cloudy;
    } else if (icon == "09n" || icon == "09d") {
      return Icons.invert_colors;
    } else if (icon == "10n" || icon == "10d") {
      return Icons.invert_colors;
    } else if (icon == "11n" || icon == "11d") {
      return Icons.flash_on;
    } else if (icon == "13n" || icon == "13d") {
      return Icons.ac_unit;
    } else if (icon == "50n" || icon == "50d") {
      return Icons.menu;
    }
  }

  Future _showWeatherDialog(context) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Center(
                child: Text(
              "TODAY",
              style:
                  Theme.of(context).textTheme.headline2.copyWith(fontSize: 30),
            )),
            content: Builder(
              builder: (context) {
                return Container(
                  height: 225,
                  width: 400,
                  child: Column(
                    children: [
                      Icon(
                        _descriptionToIcon(_forecasts[0].weatherIcon),
                        size: 100,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "${_forecasts[0].temperature.celsius}".substring(0, 4) +
                            " °C",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontSize: 15),
                      ),
                      Divider(
                        thickness: 2,
                        color: Theme.of(context).primaryColor,
                        indent: 8,
                        endIndent: 8,
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(fiveNextDays(_today.weekday + 1),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(fontSize: 10)),
                                Icon(
                                  _descriptionToIcon(_forecasts[1].weatherIcon),
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  "${_forecasts[1].temperature.celsius}"
                                          .substring(0, 4) +
                                      " °C",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(fiveNextDays(_today.weekday + 2),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(fontSize: 10)),
                                Icon(
                                  _descriptionToIcon(_forecasts[2].weatherIcon),
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  "${_forecasts[2].temperature.celsius}"
                                          .substring(0, 4) +
                                      " °C",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(fiveNextDays(_today.weekday + 3),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(fontSize: 10)),
                                Icon(
                                  _descriptionToIcon(_forecasts[3].weatherIcon),
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  "${_forecasts[3].temperature.celsius}"
                                          .substring(0, 4) +
                                      " °C",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(fiveNextDays(_today.weekday + 4),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(fontSize: 10)),
                                Icon(
                                  _descriptionToIcon(_forecasts[4].weatherIcon),
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  "${_forecasts[4].temperature.celsius}"
                                          .substring(0, 4) +
                                      " °C",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(fiveNextDays(_today.weekday + 5),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(fontSize: 10)),
                                Icon(
                                  _descriptionToIcon(_forecasts[5].weatherIcon),
                                  size: 30,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  "${_forecasts[5].temperature.celsius}"
                                          .substring(0, 4) +
                                      " °C",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ));
}