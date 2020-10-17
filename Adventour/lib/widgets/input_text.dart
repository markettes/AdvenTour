import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText(
      {this.icon = Icons.edit, this.labelText, this.controller, this.obscured});

  IconData icon;
  String labelText;
  TextEditingController controller;
  bool obscured;

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
        obscureText: obscured,
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
