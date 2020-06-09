import 'package:flutter/material.dart';

import 'package:rca/pages/Home.dart';
// INTERNAL
import 'package:rca/router.dart';
import 'package:rca/pages/Login.dart';
import 'package:rca/singleton/auth.dart';
import 'package:rca/singleton/theme.dart';

class AerialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      home: InitApp(),
      routes: routes,
    );
  }
}

class InitApp extends StatelessWidget {
  static Auth auth = Auth();

  Widget _loadingScreen() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/icons/aerial_white.png'),
          SizedBox(height: 20),
          CircularProgressIndicator()
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/backgrounds/dark.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Auth().checkToken(),
      builder: (BuildContext context, AsyncSnapshot<bool> authState) {
        bool _isLoading = authState.connectionState == ConnectionState.waiting;

        if (_isLoading) return _loadingScreen();
        if (authState.hasError) return LoginPage();
        if (authState.hasData)
          return authState.data
              ? HomePage() // valid token
              : HomePage(); // invalid token;
      },
    );
  }
}
