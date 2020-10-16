import 'package:flutter/material.dart';

import 'google_icon.dart';

class GoogleSigninButton extends StatelessWidget {
  GoogleSigninButton({
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
        color: Colors.white,
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
                    ? GoogleIconButton()
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
                        color: Colors.black,
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
