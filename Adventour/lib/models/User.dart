class User {
  String _userName;
  String _email;

  User(username, email) {
    _userName = userName;
    _email = email;
  }

  Map<String, dynamic> toFirestore() => {
        'userName': _userName,
        'email': _email,
      };

  get userName => _userName;

  get email => _email;
}
