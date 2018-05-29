import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: RegisterPage());
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("abc"),
      ),
    );
  }
}
