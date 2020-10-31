import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:Adventour/models/Place.dart';
import "package:google_maps_webservice/places.dart";

int numeroComentarios = 0;

class PlacePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        
      ),
      body: Column(
        children: <Widget>[
          InfoSuper(place: place),
          InfoMiddle(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InfoBut(icon: Icons.gps_fixed, text: "${place.formattedAddress}"),
                InfoBut(icon: Icons.local_phone, text: "${_place.formattedPhoneNumber}"),
                InfoBut(icon: Icons.access_alarm_outlined, text: "${_place.name}"),
                InfoBut(icon: Icons.calendar_today, text: openAndClose()),
                Divider(
                  thickness: 5,
                  color: Theme.of(context).primaryColor,
                )
                
              ],
            ),

          ),
          InfoBottom(),
          CommentsBar(),
        ],
      ),
    );
  }

    String itsDefined(String text) {
    if(text == null){return "No definido";}
    else{return text;}
  }

    String mostrarNombre(){
      if(_place.name.isEmpty){
        return "No definido";
      }
      else{
        return _place.name;
        }
    }

  String openAndClose(){
    int dia; 
    if(DateTime.now().weekday==7){dia = 0;}
    else{dia=DateTime.now().weekday;}
    if(_place.openingHours==null){return "No defined";}
    else{
    String numHorasAbierto = "${_place.openingHours.periods[dia-1].open.time}";
    String horasAbierto = numHorasAbierto.substring(0,2) + " : " + numHorasAbierto.substring(2,4);
    String numHorasCerrado = "${_place.openingHours.periods[6].close.time}";
    String horasCerrado = numHorasCerrado.substring(0,2) + " : " + numHorasCerrado.substring(2,4);
    return horasAbierto + " - "  + horasCerrado;
  }}
}

class InfoBut extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoBut({
    @required this.icon,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    if(this.text == null){
      return Container(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 35,
          ),
          Expanded(
                      child: Text(
              "${this.text}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
    }
    else{return Container(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 35,
          ),
          Expanded(
                      child: Text(
              "${this.text}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );}
    
  }
}

class InfoMiddle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8,right: 8),
      child: Row(
        children: <Widget>[
          Image(
            image: AssetImage('assets/rosquilleta.jpg'),
            width: 45,
            height: 45,
            
          ),
          Text(
            "4",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Icon(
            Icons.star,
            color: Theme.of(context).primaryColor,
            size: 45,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SquareIconButton(icon: Icons.map, onPressed: null),
              ],
            )
          ),
        ],
      ),
    );
      }
    }

class InfoSuper extends StatelessWidget {
    final Place place;
    const InfoSuper({
      @required this.place,
    });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      /*child: Image.network(
            "https://maps.googleapis.com/maps/api/place/photo?" + "${this.place.photos[0].photoReference}",
            fit: BoxFit.cover,
            ),*/
        );
  }
}
class InfoBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8,right: 8),
      child: Row(
        children: <Widget>[
          
          Text(
            numeroComentarios.toString() + " opiniones",
            style: Theme.of(context).textTheme.bodyText1,
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              SquareIconButton(
                icon: Icons.add_comment, 
                onPressed:(){
                } 
              ),
              ],
            )
          ),
        ],
      ),
    );
      }
    }
  class CommentsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: 1000,
        itemBuilder: (_, int index) => Text('hola'), 
      ),
    );
  }
}
