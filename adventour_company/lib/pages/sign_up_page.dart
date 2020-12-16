import 'package:adventour_company/controllers/auth.dart';
import 'package:Adventour/models/User.dart';
import 'package:adventour_company/models/Company.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credentials"),
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
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: InputText(
              icon: Icons.person,
              labelText: 'Company Name',
              maxLength: 15,
              controller: _userNameController,
              validator: (value) {
                if (value.isEmpty) return 'username_cannot';
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: InputText(
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email,
              labelText: 'Email',
              errorText: _emailError,
              controller: _emailController,
              validator: (value) {
                if (value.isEmpty) return 'email_cannot';
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: InputText(
              obscured: true,
              icon: Icons.lock,
              labelText: 'Password',
              errorText: _passwordError,
              controller: _passwordController,
              validator: (value) {
                if (value.isEmpty) return 'password_cannot';
                return null;
              },
            ),
          ),
          PrimaryButton(
            text: 'SIGN UP',
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                Company company =
                    Company(_userNameController.text, _emailController.text);
                print(company.companyName);
                try {
                  print(auth);
                  await auth.registerCompany(company, _passwordController.text);
                  Navigator.pop(context);
                } catch (e) {
                  print(e);
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
      _emailError = emailError(e);
      _passwordError = passwordError(e);
    });
  }
}
