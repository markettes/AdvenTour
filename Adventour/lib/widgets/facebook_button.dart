import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {
  FacebookButton({
    this.padding =
        const EdgeInsets.only(left: 45, right: 45, top: 8, bottom: 8),
  });
  EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RaisedButton(
        onPressed: () {}, //TODO
        color: Color(0xFF1877F2),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          /*side: BorderSide(color: Theme.of(context).primaryColor)*/
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SizedBox(
                child: Image.asset('assets/facebook_icon_button.png'),
                height: 35,
                width: 35,
              ),
            ),
            Expanded(
              child: Text(
                'Continue with Facebook',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
