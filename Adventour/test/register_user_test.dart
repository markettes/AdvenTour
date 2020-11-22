import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('with email and password', () async {
    final auth = MockFirebaseAuth();
    final result = await auth.signInWithEmailAndPassword(
        email: 'some email', password: 'some password');
    final user = result.user;
    expect(user.uid, isNotEmpty);
    expect(user.displayName, isNotEmpty);
    expect(auth.authStateChanges(), emitsInOrder([isA<User>()]));
  });

  test('with google', () async {
    final auth = MockFirebaseAuth();
    // Credentials would typically come from GoogleSignIn.
    final credential = FakeAuthCredential();
    final result = await auth.signInWithCredential(credential);
    final user = result.user;
    expect(user.uid, isNotEmpty);
    expect(user.displayName, isNotEmpty);
    expect(auth.authStateChanges(), emitsInOrder([isA<User>()]));
    expect(user.isAnonymous, isFalse);
  });
}

class FakeAuthCredential extends Mock implements AuthCredential {}
