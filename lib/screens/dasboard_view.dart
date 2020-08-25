import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  static const routeName = "/Dashboard";
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  var pengguna;
  @override
  Widget build(BuildContext context) {
    getFromSharedPreferences();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // return Scaffold(
    //   backgroundColor: Colors.blue,
    //   body: Center(
    //       // color: ColorPalette.primaryColor,
    //       // padding: EdgeInsets.all(20.0),
    //       child: Text("Selamat Datang $pengguna"),

    //       ),

    // );
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Selamat Datang'),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
      body: Center(
          child: Text(
        "Selamat Datang $pengguna \n Pencet icon sudut kanan atas untuk keluar",
        style: TextStyle(fontSize: 22.0),
        textAlign: TextAlign.center,
      )),
    ));
  }

  getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    pengguna = prefs.getString("pengguna");
  }
}
