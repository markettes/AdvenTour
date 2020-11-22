import 'package:Adventour/controllers/db.dart';
import 'package:Adventour/models/User.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('registered and storaged user succesfully', () async {
    User user = new User('prueba111', 'prueba111@gmail.com');
    await db.addUser(user);
  });
}
