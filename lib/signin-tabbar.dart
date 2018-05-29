import 'package:flutter/material.dart';
import 'signin-form.dart';
import 'regis-form.dart';

class SignInTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.lock_open)),
                new Tab(icon: new Icon(Icons.person_add)),
              ],
            ),
            title: new Text('Facgure Flutter Tutorial'),
          ),
          body: new TabBarView(
            children: [
              new SignInForm(),
              new RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
