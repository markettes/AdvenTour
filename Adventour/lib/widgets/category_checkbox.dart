import 'package:flutter/material.dart';

class CategoryCheckbox extends StatefulWidget {
  CategoryCheckbox(this.category, this.icon);

  final String category;
  final IconData icon;

  @override
  _CategoryCheckboxState createState() => _CategoryCheckboxState();
}

class _CategoryCheckboxState extends State<CategoryCheckbox> {
  bool _active = true;
  void _onTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      shape: CircleBorder(),
      onPressed: _onTap,
      child: Center(
          child: Icon(
        widget.icon,
        color: Colors.white,
      )),
    );
  }
}
