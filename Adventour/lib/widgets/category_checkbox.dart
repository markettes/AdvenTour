import 'package:flutter/material.dart';

class CategoryCheckbox extends StatefulWidget {
  CategoryCheckbox(this.category, this.icon);

  final String category;
  final IconData icon;
  bool _active = false;

  @override
  _CategoryCheckboxState createState() => _CategoryCheckboxState();
}

class _CategoryCheckboxState extends State<CategoryCheckbox> {
  double _opacity = 0.5;
  void _onTap() {
    setState(() {
      widget._active = !widget._active;
      _opacity = widget._active ? 1.0 : 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity,
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        shape: CircleBorder(),
        onPressed: _onTap,
        child: Center(
            child: Icon(
          widget.icon,
          color: Colors.white,
        )),
      ),
    );
  }
}
