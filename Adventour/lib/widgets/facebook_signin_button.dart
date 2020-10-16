import 'package:Adventour/widgets/facebook_icon.dart';
import 'package:flutter/material.dart';

class FacebookSigninButton extends StatelessWidget {
  FacebookSigninButton({
    this.text,
    this.onPressed,
    this.padding =
        const EdgeInsets.only(left: 45, right: 45, top: 8, bottom: 8),
    this.icon,
  });
  String text;
  Function onPressed;
  EdgeInsetsGeometry padding;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RaisedButton(
        onPressed: onPressed,
        color: Color(0xFF1877F2),
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
                    ? FacebookIconButton()
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
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
