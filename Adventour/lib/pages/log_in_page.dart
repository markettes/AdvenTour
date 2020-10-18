import 'package:Adventour/controllers/auth.dart';
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
          InputText(
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
          Text(
            'Forgot password?',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          PrimaryButton(
            text: 'LOG IN',
            style: ButtonType.Normal,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                try {
                  await auth.signIn(
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

  void _showError(error) {
    setState(() {
      _emailError = null;
      _passwordError = null;
      switch (error.code) {
        case 'ERROR_INVALID_EMAIL':
          _emailError = 'Email incorrecto';
          break;
        case 'ERROR_WRONG_PASSWORD':
          _passwordError = 'Contraseña incorrecta';
          break;
        case 'ERROR_USER_NOT_FOUND':
          _emailError = 'Email no registrado, porfavor registrate';
          break;
        case 'ERROR_USER_DISABLED':
          _emailError = 'Usuario deshabilitado, consulte con ...';
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          _emailError = 'Demasiados intentos, intentelo más tarde';
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          _emailError = 'Email no permitido';
          break;
        default:
          print('problemas de conexión');
      }
    });
  }
}
