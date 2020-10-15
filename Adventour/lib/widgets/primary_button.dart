import 'package:Adventour/widgets/adventour_icon.dart';
import 'package:flutter/material.dart';

enum ButtonType { Normal, Void }

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    this.text,
    this.onPressed,
    this.style = ButtonType.Normal,
    this.padding =
        const EdgeInsets.only(left: 45, right: 45, top: 8, bottom: 8),
    this.icon,
  });
  String text;
  Function onPressed;
  ButtonType style;
  EdgeInsetsGeometry padding;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RaisedButton(
        onPressed: onPressed,
        color: style == ButtonType.Normal
            ? Theme.of(context).buttonColor
            : Theme.of(context).backgroundColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          /*side: BorderSide(color: Theme.of(context).primaryColor)*/
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SizedBox(
                child: icon == null
                    ? AdventourIcon()
                    : Icon(
                        icon,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                height: 35,
                width: 35,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
