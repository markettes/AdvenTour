import 'package:flutter/material.dart';

class CategoryCheckbox extends StatefulWidget {
  CategoryCheckbox(this.category);

  final String category;

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
      padding: EdgeInsets.all(10),
      onPressed: _onTap,
      child: Center(
          child: Column(
        children: [
          Icon(Icons.ac_unit),
        ],
      )),
    );
  }
}
