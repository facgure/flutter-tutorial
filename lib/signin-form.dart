import 'package:flutter/material.dart';
import 'package:validate/validate.dart';

// main class to run with stateless widget
class SignInForm extends StatelessWidget {
  // create material theme of the app
  @override
  Widget build(BuildContext context) {
    return new Container(child: SignInPage());
    /*
      return new MaterialApp(
         debugShowCheckedModeBanner: false,
         theme: new ThemeData(
            primarySwatch: Colors.blue,
         ),
         home: new SignInPage(),
      );
      */
  }
}

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignInPageState();
}

class _SignInData {
  String email = '';
  String password = '';
}

// Sign In state
class _SignInPageState extends State<SignInPage> {
  // properties
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _SignInData _data = _SignInData();

  // function to validate email
  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail address must be a valid email address.';
    }

    return null;
  }

  // function to validate password
  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The password must be at least 8 characters.';
    }

    return null;
  }

  // function to handle the submission
  void submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      print('Printing the sign-in data.');
      print('Email: ' + _data.email);
      print('Password: ' + _data.password);
    }
  }

  // build user interface function
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return /*new Scaffold(
         //appBar: new AppBar(
            //title: new Text('Flutter Tutorial'),
         //),
         body: */
        new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Form(
              key: this._formKey,
              child: new ListView(
                children: <Widget>[
                  // textbox for email address
                  new TextFormField(
                      keyboardType: TextInputType
                          .emailAddress, // Use email input type for emails.
                      decoration: new InputDecoration(
                          hintText: 'you@example.com',
                          labelText: 'Enter email address',
                          icon: const Icon(Icons.email, color: Colors.blue)),
                      validator: this._validateEmail,
                      onSaved: (String value) {
                        this._data.email = value;
                      }),

                  // passwordbox for password
                  new TextFormField(
                      obscureText: true, // Use secure text for passwords.
                      decoration: new InputDecoration(
                          hintText: 'Password',
                          labelText: 'Enter your password',
                          icon: const Icon(
                            Icons.vpn_key,
                            color: Colors.blue,
                          )),
                      validator: this._validatePassword,
                      onSaved: (String value) {
                        this._data.password = value;
                      }),

                  // button to login
                  new Container(
                    child: new RaisedButton(
                      child: new Text('Sign In',
                          style: new TextStyle(color: Colors.white)),
                      onPressed: this.submit,
                      color: Colors.blue,
                    ),
                    margin: new EdgeInsets.only(top: 20.0),
                  )
                ],
              ),
            )
            //),
            );
  }
}
