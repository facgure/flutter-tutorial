// Create an infinite scrolling lazily loaded list

/** acquire all packages that required in this app */
import 'package:flutter/material.dart';

/// Uncomment below to enable Startup Name Generator (from Google Codelabs)
/// import 'package:english_words/english_words.dart';
import 'signin-tabbar.dart';
//import 'signin-form.dart';

// start to run the app
//void main() => runApp(new MyApp());
void main() => runApp(new SignInTabBar());

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
