import 'package:Adventour/controllers/auth.dart';
import 'package:Adventour/models/User.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Put your credentials'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SignInForm(),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _emailError;
  String _passwordError;
  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ScrollColumnExpandable(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/logo_adventour+titulo.png',
            height: 180,
          ),
          InputText(
            icon: Icons.person,
            labelText: 'Username',
            maxLength: 15,
            controller: _userNameController,
            validator: (value) {
              if (value.isEmpty) return 'Username can\'t be empty';
              return null;
            },
          ),
          InputText(
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email,
            labelText: 'Email',
            errorText: _emailError,
            controller: _emailController,
            validator: (value) {
              if (value.isEmpty) return 'Email can\'t be empty';
              return null;
            },
          ),
          InputText(
            obscured: true,
            icon: Icons.lock,
            labelText: 'Password',
            errorText: _passwordError,
            controller: _passwordController,
            validator: (value) {
              if (value.isEmpty) return 'Password can\'t be empty';
              return null;
            },
          ),
          PrimaryButton(
            text: 'SIGN UP',
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                User user =
                    User(_userNameController.text, _emailController.text);
                try {
                  await auth.registerUser(user, _passwordController.text);
                  Navigator.pop(context);
                } catch (e) {
                  _showError(e);
                }
              }
            },
          ),
        ],
      ),
    );
  }

  void _showError(e) {
    setState(() {
      _emailError = authError(e);
      _passwordError = authError(e);
    });
  }
}
