
import 'package:adventour_company/widgets/google_button.dart';
import 'package:adventour_company/widgets/primary_button.dart';
import 'package:flutter/material.dart';



class StatsPage extends StatelessWidget {
  StatsPage({this.allowSignUp = true});
  bool allowSignUp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  
                  
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
