import 'package:flutter/material.dart';
// import 'package:gradient_text/gradient_text.dart';
import 'package:gradient_input_border/gradient_input_border.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(brightness: Brightness.dark),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

var _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: _formKey,
            child: _SignInFormColumn(),
          ),
        ),
      ),
    );
  }
}

class _SignInFormColumn extends StatelessWidget {
  const _SignInFormColumn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _iconCircleAvatar(),
        SizedBox(height: 10),
        _signInGradientText(),
        SizedBox(height: 40),
        _usernameTextFormField(),
        SizedBox(height: 10),
        _passwordTextFormField(),
        SizedBox(height: 10),
        _signInRaisedButton(),
        SizedBox(height: 40),
        _createAccountGestureDetector(),
      ],
    );
  }

  Widget _iconCircleAvatar() {
    return CircleAvatar(
      backgroundColor: Colors.black38,
      child: RadiantGradientMask(
        child: Icon(
          Icons.person,
          size: 40,
        ),
      ),
      radius: 40,
    );
  }

  Widget _signInGradientText() {
    return GradientText(
      'Sign in',
      gradient: LinearGradient(
        colors: [Colors.greenAccent, Colors.blueGrey],
      ),
      style: TextStyle(fontSize: 28),
    );
  }

  Widget _usernameTextFormField() {
    return TextFormField(
      cursorColor: Colors.greenAccent,
      decoration: InputDecoration(
        labelText: 'Username or Email',
        hintText: 'Enter username or email',
        border: GradientOutlineInputBorder(
          focusedGradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.blueGrey],
          ),
          unfocusedGradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.blueGrey],
          ),
        ),
      ),
    );
  }

  Widget _passwordTextFormField() {
    return TextFormField(
      obscureText: true,
      cursorColor: Colors.greenAccent,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter password',
        border: GradientOutlineInputBorder(
          focusedGradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.blueGrey],
          ),
          unfocusedGradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.blueGrey],
          ),
        ),
      ),
    );
  }

  Widget _signInRaisedButton() {
    return Container(
      width: double.maxFinite,
      child: RaisedButton(
        onPressed: () {},
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.greenAccent, Colors.blueGrey],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Container(
            constraints:
                BoxConstraints(maxWidth: double.maxFinite, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createAccountGestureDetector() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientText(
            "Don't have an account? ",
            gradient:
                LinearGradient(colors: [Colors.greenAccent, Colors.blueGrey]),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            'Create one!',
            style: TextStyle(
              color: Colors.cyanAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class _UsernameTextFormField extends StatelessWidget {
  const _UsernameTextFormField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.greenAccent,
      decoration: InputDecoration(
        labelText: 'Username or Email',
        hintText: 'Enter username or email',
        border: GradientOutlineInputBorder(
          focusedGradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.blueGrey],
          ),
          unfocusedGradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.blueGrey],
          ),
        ),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [Colors.greenAccent, Colors.blueGrey],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}
