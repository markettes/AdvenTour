import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({this.icon = Icons.edit, this.labelText, this.controller});

  IconData icon;
  String labelText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
        top: 8,
        bottom: 8,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            size: 30,
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
