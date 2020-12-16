import 'package:Adventour/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

class WeatherWidget extends StatelessWidget {
  WeatherWidget({@required this.position});
  Position position;

  WeatherFactory _ws = WeatherFactory("6dfa830bb9af38b050628b6fd2701df6");
  List<Weather> _forecasts;
  Weather _weatherNow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: FutureBuilder(
          future: _ws.currentWeatherByLocation(
              position.latitude, position.longitude),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (!snapshot.hasData) return Container();
            _weatherNow = snapshot.data;
            return GestureDetector(
              child: SizedBox(
                  height: 50,
                  child: NetworkImageShadow(
                      image: 'http://openweathermap.org/img/wn/' +
                          _weatherNow.weatherIcon +
                          '@2x.png')),
              onTap: () async {
                await _weatherIn();
                _showWeatherDialog(context);
              },
            );
          }),
    );
  }

  Future<void> _weatherIn() async {
    _forecasts = await _ws.fiveDayForecastByLocation(
        position.latitude, position.longitude);
    print('?' + _forecasts.length.toString());
  }

  Future _showWeatherDialog(context) => showDialog(
        context: context,
        builder: (context) => WeatherDialog(
          forecasts: _forecasts,
          weatherNow: _weatherNow,
        ),
      );
}

class WeatherDialog extends StatelessWidget {
  const WeatherDialog({@required this.forecasts, @required this.weatherNow});

  final List<Weather> forecasts;
  final Weather weatherNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        backgroundColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Center(
            child: Text(
          AppLocalizations.of(context).translate('now'),
          style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 30),
        )),
        content: Container(
          height: 300,
          child: Column(
            children: [
              Expanded(
                  child: DayWidget(
                weather: weatherNow,
                showWeekday: false,
              )),
              Divider(
                thickness: 2,
                color: Theme.of(context).primaryColor,
                indent: 8,
                endIndent: 8,
                height: 30,
              ),
              Expanded(
                child: Row(children: [
                  Expanded(
                    child: DayWidget(
                      weather: forecasts[0],
                    ),
                  ),
                  Expanded(
                    child: DayWidget(weather: forecasts[8]),
                  ),
                  Expanded(
                    child: DayWidget(weather: forecasts[16]),
                  ),
                  Expanded(
                    child: DayWidget(weather: forecasts[24]),
                  ),
                  Expanded(
                    child: DayWidget(weather: forecasts[32]),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DayWidget extends StatelessWidget {
  DayWidget(
      {@required this.weather,
      this.showWeekday = true,
      this.showTemperature = true});

  Weather weather;
  bool showWeekday;
  bool showTemperature;

  String _fiveNextDays(int day) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showWeekday)
          Text(_fiveNextDays(weather.date.weekday),
              style:
                  Theme.of(context).textTheme.headline2.copyWith(fontSize: 12)),
        NetworkImageShadow(
            image: 'http://openweathermap.org/img/wn/' +
                weather.weatherIcon +
                '@2x.png'),
        if (showTemperature)
          Text(
            "${weather.temperature.celsius}".substring(0, 4) + " °C",
            style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 12),
          ),
      ],
    );
  }
}

class NetworkImageShadow extends StatelessWidget {
  const NetworkImageShadow({
    @required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          image,
        ),
        Image.network(
          image,
          color: Theme.of(context).primaryColor.withAlpha(70),
        ),
      ],
    );
  }
}
