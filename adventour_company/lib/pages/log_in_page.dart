import 'package:adventour_company/controllers/auth.dart';
import 'package:Adventour/widgets/google_button.dart';
import 'package:Adventour/widgets/input_text.dart';
import 'package:Adventour/widgets/primary_button.dart';
import 'package:Adventour/widgets/scroll_column_expandable.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Put your credentials'),
      ),
      body: Padding(padding: EdgeInsets.all(10), child: LogInForm()),
    );
  }
}

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _emailError;
  String _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              obscured: false,
              icon: Icons.email,
              labelText: 'Email',
              errorText: _emailError,
              controller: _emailController,
              validator: (value) {
                if (value.isEmpty) return 'Email can\'t be empty';
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
                if (value.isEmpty) return 'Password can\'t be empty';
                return null;
              },
            ),
          ),
          // Text(
          //   'Forgot password?',
          //   style: Theme.of(context).textTheme.bodyText1,
          // ),
          PrimaryButton(
            text: 'LOG IN',
            style: ButtonType.Normal,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                try {
                  await auth.companySignIn(
                      _emailController.text, _passwordController.text);
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
      _emailError = emailError(e);
      _passwordError = passwordError(e);
    });
  }
}
