import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Achievements"),
      ),
      body: ScrollColumnExpandable(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.emoji_events,
                          size: 50,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "MARATÓN ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '"Recorre 10 km en bici"',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right:10, left: 10),
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.5,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "X",
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ))),
                            ),
                          ),
                        )
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                    indent: 10,
                    endIndent: 10,
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          PrimaryButton(text: 'RETURN', onPressed: () async {Navigator.pop(context);})
        ],
      ),
    );
  }
}
