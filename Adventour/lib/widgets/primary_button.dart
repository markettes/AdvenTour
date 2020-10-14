import 'package:Adventour/widgets/adventour_icon.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({this.text, this.onPressed});
  String text;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).accentColor,
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SizedBox(
                        child: AdventourIcon(),
                        height: 35,
                        width: 35,
                      ),
                    ),
                    Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            onTap: onPressed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: Row(
            children: [
              Expanded(
                child: RaisedButton(
                  onPressed: onPressed,
                  color: Theme.of(context).accentColor,
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: SizedBox(
                          child: AdventourIcon(),
                          height: 35,
                          width: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 78),
                        child: Text(
                          text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
