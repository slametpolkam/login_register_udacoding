import 'package:flutter/material.dart';
import 'package:login_register/constants.dart';
import 'package:login_register/screens/register_view.dart';
import 'package:login_register/screens/dasboard_view.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconLogin(),
                  _titleDescription(),
                  _textField(context),
                  // _buildButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _iconLogin() {
  return Image.asset(
    "assets/images/logo.png",
    height: 150.0,
    width: 150.0,
  );
}

Widget _titleDescription() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      Text(
        "Masuk Kedalam Sistem",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      Text(
        "Silahkan Login Kedalam Sistem",
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget _textField(BuildContext context) {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var pengguna;
  void setIntoSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("pengguna", pengguna);
  }

  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      TextFormField(
        controller: _usernameController,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.underlineTextField,
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          hintText: "Username",
          hintStyle: TextStyle(color: ColorPalette.hintColor),
        ),
        style: TextStyle(color: Colors.white),
        autofocus: false,
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      TextFormField(
        controller: _passwordController,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.underlineTextField,
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          hintText: "Password",
          hintStyle: TextStyle(color: ColorPalette.hintColor),
        ),
        style: TextStyle(color: Colors.white),
        obscureText: true,
        autofocus: false,
      ),
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      FlatButton(
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        // ignore: missing_return
        onPressed: () {
          pengguna = _usernameController
              .text; //Mengisi variabel pengguna dengan inputan pengguna
          if (_usernameController.text.trim() == "admin" &&
              _passwordController.text.trim() == "admin") {
            setIntoSharedPreferences(); //memanggil method setIntoSharedPreferences
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          } else {
            /**
             * Membuat Alert jika gagal login
             */
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Login Gagal " + pengguna),
                );
              },
            );
          }
        },
      ),
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      Text(
        'or',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
      FlatButton(
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, RegisterPage.routeName);
        },
      ),
    ],
  );
}
