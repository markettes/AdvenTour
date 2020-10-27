import 'package:flutter/material.dart';

class InformationPlacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nombre tienda'),
          backgroundColor: Colors.deepPurple,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: <Widget>[
            InfoSuper(),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: InfoMiddle(),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  InfoBut(icon: Icons.gps_fixed, text: "Carrer"),
                  InfoBut(icon: Icons.local_phone, text: "Carrer"),
                  InfoBut(icon: Icons.access_alarm_outlined, text: "Carrer"),
                  InfoBut(icon: Icons.calendar_today, text: "Carrer"),
                  SizedBox(height: 15),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.deepPurple,
                width: 3,
              ))),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoBut extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoBut({
    Key key,
    @required this.icon,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            color: Colors.deepPurple,
            size: 35,
          ),
          SizedBox(width: 15),
          Text(
            "${this.text}",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class InfoMiddle extends StatelessWidget {
  const InfoMiddle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage('assets/rosquilleta.jpg'),
            width: 75,
            height: 75,
          ),
          SizedBox(width: 15),
          Text(
            "4",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.deepPurple,
            size: 45,
          ),
          Expanded(
            child: FlatButton(
              padding: EdgeInsets.only(left: 150),
              onPressed: null,
              child: Icon(
                Icons.map,
                color: Colors.deepPurple,
                size: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoSuper extends StatelessWidget {
  const InfoSuper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/rosquilleta.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
