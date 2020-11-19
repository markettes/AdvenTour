import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  InputText({
    this.icon = Icons.edit,
    this.labelText,
    this.errorText,
    @required this.controller,
    this.obscured = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onTap,
    this.readOnly = false,
    this.maxLength
  });

  IconData icon;
  String labelText;
  String errorText;
  TextEditingController controller;
  bool obscured;
  TextInputType keyboardType;
  Function(String value) validator;
  Function() onTap;
  bool readOnly;
  int maxLength;

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
        right: 40,
        top: 8,
        bottom: 8,
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obscured,
        controller: widget.controller,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            size: 30,
          ),
          labelText: widget.labelText,
          errorText: widget.errorText,
          suffixIcon: widget.controller.text.length > 0 && !widget.readOnly
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      widget.controller.clear();
                    });
                  })
              : null,
        ),
        onChanged: (value) {
          setState(() {});
        },
        onTap: widget.onTap,
        validator: widget.validator,
      ),
    );
  }
}
