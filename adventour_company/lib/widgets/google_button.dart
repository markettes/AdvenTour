import 'package:Adventour/controllers/auth.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({
    this.padding =
        const EdgeInsets.only(left: 45, right: 45, top: 8, bottom: 8),
  });
  EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RaisedButton(
        onPressed: () async {
          try {
            await auth.signInWithGoogle(context);
          } catch (e) {
            print(e);
          }
        },
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SizedBox(
                child: Image.asset('assets/google_icon_button.png'),
                height: 35,
                width: 35,
              ),
            ),
            Expanded(
              child: Text(
                'Continue with google',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
