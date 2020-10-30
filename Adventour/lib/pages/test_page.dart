import 'package:Adventour/widgets/category_checkbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TestPage());
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Hola");
    return MaterialApp(
      theme: Theme.of(context),
      home: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CategoryCheckbox("hola", Icons.restaurant),
            ),
          ],
        ),
      ),
    );
  }
}
