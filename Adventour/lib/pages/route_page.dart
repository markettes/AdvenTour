import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creating your route'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(
                    'assets/logo_adventour.png',
                  ),
                ),
              ),
              Expanded(
                child: Column(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrimaryButton(
                      text: 'HIGHLIGHTS',
                      onPressed: () {
                        //Navigator.of(context).pushNamed('/xxx');
                      },
                      icon: Icons.star,
                      style: ButtonType.Void,
                    ),
                    PrimaryButton(
                      text: 'CUSTOM',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/customRoutePage');
                      },
                      icon: Icons.edit,
                      style: ButtonType.Normal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
