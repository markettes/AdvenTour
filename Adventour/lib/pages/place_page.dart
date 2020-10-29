import 'package:Adventour/widgets/circle_icon_button.dart';
import 'package:Adventour/widgets/square_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';


int numeroComentarios = 0;

class PlacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre tienda'),
      ),
      body: Column(
        children: <Widget>[
          InfoSuper(),
          InfoMiddle(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InfoBut(icon: Icons.gps_fixed, text: "Carrer"),
                InfoBut(icon: Icons.local_phone, text: "Carrer"),
                InfoBut(icon: Icons.access_alarm_outlined, text: "Carrer"),
                InfoBut(icon: Icons.calendar_today, text: "Carrer"),
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
    return Container(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 35,
          ),
          Text(
            "$text",
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
