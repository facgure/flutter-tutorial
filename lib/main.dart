// Create an infinite scrolling lazily loaded list

/** acquire all packages that required in this app */
import 'package:flutter/material.dart';
/// Uncomment below to enable Startup Name Generator (from Google Codelabs)
/// import 'package:english_words/english_words.dart';
import 'package:validate/validate.dart';

// start to run the app
void main() => runApp(new MyApp());

// main class to run with stateless widget
class MyApp extends StatelessWidget {
  // create material theme of the app
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = _LoginData();

  String _validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail address must be a valid email address.';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The password must be at least 8 characters.';
    }

    return null;
  }

  void submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      print('Printing the login data.');
      print('Email: '+ _data.email);
      print('Password: ' +_data.password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: new Form(
            key: this._formKey,
            child: new ListView(
              children: <Widget>[

                // textbox for email address 
                new TextFormField(
                    keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                    decoration: new InputDecoration(
                        hintText: 'you@example.com',
                        labelText: 'E-mail Address'),
                    validator: this._validateEmail,
                    onSaved: (String value) {
                      this._data.email = value;
                    }),
                
                // passwordbox for password 
                new TextFormField(
                    obscureText: true, // Use secure text for passwords.
                    decoration: new InputDecoration(
                        hintText: 'Password', labelText: 'Enter your password'),
                    validator: this._validatePassword,
                    onSaved: (String value) {
                      this._data.password = value;
                    }),
                  
                // button to login
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'Login',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: this.submit,
                    color: Colors.green,
                  ),
                  margin: new EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}

///
/// Tutorial about Startup Name Generator (from Google Codelabs)
/// 

/*class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
          //new IconButton(icon: const Icon(Icons.favorite_border), onPressed: null)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  // call this function when the list icon has been tapped
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _saved.map(
          (WordPair pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
              trailing:
                  new Icon(Icons.remove_circle_outline, color: Colors.red),
              onTap: () {
                showDialog(
                    context: context,
                    child: new AlertDialog(
                      title: new Text("Remove from favorite?"),
                      content: new Text(pair.asPascalCase),
                    ));
              },
            );
          },
        );

        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();

        return new Scaffold(
          appBar: new AppBar(
            title: const Text("Saved Favorites"),
          ),
          body: new ListView(children: divided),
        );
      }),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return const Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
  }
}
*/